# ADT setup - push / activate / read errors / fix loop

> Status: **written without a system and never run.** The `abap-adt-api` calls below follow
> the library's public API as known at the time of writing. Check method signatures
> against the installed version (`node_modules/abap-adt-api/build/api/*.d.ts`) before you
> rely on them.

This explains how to drive the library into a real S/4HANA 2025 system from a script with
[`abap-adt-api`](https://github.com/marcellourbani/abap-adt-api) (the Node.js ADT client
that the vscode_abap_remote_fs extension uses), and how to run the fix loop until every
object activates.

## 1. Prerequisites on the SAP system

| Item | Where | Notes |
|---|---|---|
| ICF services `/sap/bc/adt/*` active | `SICF` | Usually active wherever Eclipse ADT works |
| Developer user with `S_DEVELOP` for package `ZEAM_VDM` (or customer package), `S_ADT_RES`, `S_RFC` | `PFCG` | Plus `S_TRANSPRT` / `S_CTS_ADMI` for creating transports |
| Package and transport request | `SE80` / ADT | Or create through the API (see `createTransport` below) |
| Network path from the machine running the script to the HTTPS port | - | Note the system's client and logon language |

## 2. Local setup

```bash
npm init -y
npm install abap-adt-api@latest
export ADT_URL=https://s4h2025.example.com:44300
export ADT_USER=DEVELOPER
export ADT_PASSWORD='***'          # use a secret store in CI
export ADT_CLIENT=100
export ADT_LANGUAGE=EN
export ADT_PACKAGE=ZEAM_VDM
export ADT_TRANSPORT=S4HK900123    # leave empty for $TMP-like local packages
```

## 3. Which objects, in which order

Always push the **output of the build**, not the raw `src/`. Then prefixes, the module
selection and link views match what a customer would get:

```bash
python3 build_package.py --product eam --all --with-tests --out dist/all.zip
unzip -o dist/all.zip -d dist/all
cat dist/all/ACTIVATION_ORDER.txt
```

ADT object types and URIs used by the loop:

| abapGit file | ADT type | Object URI | Source URI |
|---|---|---|---|
| `*.ddls.asddls` | `DDLS/DF` | `/sap/bc/adt/ddic/ddl/sources/<name>` | `<objectUri>/source/main` |
| `*.dcls.asdcls` | `DCLS/DL` | `/sap/bc/adt/acm/dcl/sources/<name>` | `<objectUri>/source/main` |
| `*.ddlx.asddlx` | `DDLX/EX` | `/sap/bc/adt/ddic/ddlx/sources/<name>` | `<objectUri>/source/main` |
| `*.clas.abap` | `CLAS/OC` | `/sap/bc/adt/oo/classes/<name>` | `<objectUri>/source/main` |

(`<name>` lower case and URL-encoded; namespaces `/ACME/` become `%2facme%2f`.)
TODO-VERIFY (doc): confirm the type codes and URIs with `client.objectTypes()` /
`client.searchObject()` on the target system.

## 4. The loop

```
┌──────────────────────────────────────────────────────────────────────────┐
│ 1. build_package.py  → dist/<build>/src + ACTIVATION_ORDER.txt          │
│ 2. PUSH   for each object in order: create if missing, lock, write      │
│           source, unlock                                                 │
│ 3. ACTIVATE  mass-activate everything that is inactive                   │
│ 4. READ ERRORS  collect activation messages (+ syntaxCheck per object)   │
│ 5. FIX   edit src/ in git (never only in the system), abaplint,          │
│          tools/validate_repo.py, commit                                  │
│ 6. repeat 1-5 until activation result is clean                           │
│ 7. run ABAP Unit (unitTestRun) + smoke checks from ACTIVATION_CHECKLIST  │
│ 8. update module.json status / tested_release, BATCH_REPORT.md          │
└──────────────────────────────────────────────────────────────────────────┘
```

### Example script (`adt-loop.mjs`, draft, never run)

```js
// Usage: node adt-loop.mjs dist/all
import { ADTClient, session_types } from "abap-adt-api";
import { readFileSync, existsSync } from "node:fs";
import { join } from "node:path";

const dir = process.argv[2];
const env = process.env;
const client = new ADTClient(env.ADT_URL, env.ADT_USER, env.ADT_PASSWORD, env.ADT_CLIENT, env.ADT_LANGUAGE);
client.stateful = session_types.stateful;       // locks need a stateful session
await client.login();

const TYPES = {
  DDLS: { adt: "DDLS/DF", base: "/sap/bc/adt/ddic/ddl/sources/", ext: ".ddls.asddls" },
  DCLS: { adt: "DCLS/DL", base: "/sap/bc/adt/acm/dcl/sources/", ext: ".dcls.asdcls" },
  DDLX: { adt: "DDLX/EX", base: "/sap/bc/adt/ddic/ddlx/sources/", ext: ".ddlx.asddlx" },
  CLAS: { adt: "CLAS/OC", base: "/sap/bc/adt/oo/classes/",       ext: ".clas.abap" },
};
const order = readFileSync(join(dir, "ACTIVATION_ORDER.txt"), "utf8")
  .split("\n").filter(Boolean)
  .map(l => { const [, type, name] = l.trim().split(/\s+/); return { type, name }; });

const uriOf = o => TYPES[o.type].base + encodeURIComponent(o.name.toLowerCase());
const fileOf = o => join(dir, "src", o.name.toLowerCase().replace(/\//g, "#") + TYPES[o.type].ext);

// --- 2. PUSH --------------------------------------------------------------
for (const o of order) {
  const objectUri = uriOf(o);
  const exists = await client.objectStructure(objectUri).then(() => true, () => false);
  if (!exists) {
    await client.createObject({
      objtype: TYPES[o.type].adt, name: o.name, parentName: env.ADT_PACKAGE,
      description: o.name, parentPath: "/sap/bc/adt/packages/" + encodeURIComponent(env.ADT_PACKAGE.toLowerCase()),
      responsible: env.ADT_USER, transport: env.ADT_TRANSPORT || undefined,
    });
  }
  const lock = await client.lock(objectUri);
  try {
    await client.setObjectSource(objectUri + "/source/main", readFileSync(fileOf(o), "utf8"),
                                 lock.LOCK_HANDLE, env.ADT_TRANSPORT || undefined);
  } finally {
    await client.unLock(objectUri, lock.LOCK_HANDLE);
  }
  console.log("pushed", o.type, o.name);
}

// --- 3. ACTIVATE + 4. READ ERRORS ------------------------------------------
const inactive = await client.inactiveObjects();
const result = await client.activate(inactive.map(r => r.object).filter(Boolean));
for (const m of result.messages ?? []) {
  console.log(`${m.type} ${m.objDescr ?? ""} ${m.shortText ?? ""} ${m.href ?? ""}`);
}
console.log(result.success ? "ACTIVATION OK" : "ACTIVATION FAILED");

// Optional: per-object syntax check gives line/column positions
// const check = await client.syntaxCheck(objectUri, objectUri + "/source/main", source);

// --- 7. ABAP Unit ------------------------------------------------------------
for (const o of order.filter(x => x.type === "CLAS")) {
  const run = await client.unitTestRun(uriOf(o));
  console.log(JSON.stringify(run, null, 2));
}
await client.logout();
process.exit(result.success ? 0 : 1);
```

### Reading activation errors

- `activate()` returns `{ success, messages[], inactive[] }`. Each message has a type
  (`E`/`W`/`I`), a short text and an `href` pointing to object + position
  (`#start=<line>,<col>`). Map the object name back to `packages/<product>/src/<name>.<type>` (undo the
  prefix rewrite: `ZACME_` → `ZEAM_`). The line numbers match because the build does not
  change line structure.
- Typical first-import errors and what they mean for this library:

| Message pattern | Likely TODO-VERIFY item | Fix |
|---|---|---|
| `Column X is unknown` / `X is not a component of I_Equipment` | EQ-0xx / FL-0xx | Use the real element name from the SAP view; update docs |
| `Association _Y ... target ... does not exist` | EQ-002/003, FL-003 | Remove the association or point it at the correct released view |
| `Element X of role ... unknown` (DCL) | EQ-D01 / FL-D01 | Project the missing element in the view, or use `replacing { element ... with ... }` |
| `Annotation ... not allowed` | GEN-Q0x, EQ-004 | Remove or replace the annotation |
| abapGit: `SOURCE_TYPE` / object cannot be deserialized | GEN-A01 | Correct `SOURCE_TYPES` in `tools/sync_xml.py`, re-run it |

### Fix rules

1. Change sources only in git (`packages/<product>/src`). Re-run
   `python3 tools/check_all.py --only <product> --fix` and then without `--fix`.
2. When an item is confirmed (activated without error **and** the data preview is
   plausible), delete its `TODO-VERIFY` marker and add a line to the *Verification log* in
   `BATCH_REPORT.md`.
3. Only after a clean activation, set `module.json` status to `activated`. Set it to
   `tested` only after ABAP Unit and the smoke checks in `ACTIVATION_CHECKLIST.md` pass.

## 5. Alternative: abapGit import, then ADT for the fix loop

If you would rather not create objects through the API:

1. `python3 build_package.py --product <product> <modules> --with-tests` → ZIP.
2. In SAP GUI run `ZABAPGIT` → *New Offline* → package → *Import ZIP* → *Pull*.
3. abapGit shows activation errors in its log. Fix in git, rebuild, pull again.
4. Use the script above only for activation and ABAP Unit
   (`inactiveObjects` / `activate` / `unitTestRun`).

## 6. CI idea (later)

Run steps 1-7 in a pipeline against a sandbox system after every merge to `main`.
Fail the pipeline on activation errors or ABAP Unit failures. Store the activation log
as an artifact. Never point it at a productive or shared development client.
