# Activation checklist

> **Nothing in this repository has been activated.** No SAP system was available while
> writing it. Every module is `draft-unverified`, tested release: `none (draft, 2025 assumed)`.
> This file is the plan for the first import into a real SAP S/4HANA 2025 system.

The object order below comes from `python3 build_package.py --all --with-tests --activation-order`,
which sorts objects by the references between them. Regenerate it after each batch; a
customer build writes the same order into `ACTIVATION_ORDER.txt` inside the ZIP.

## 0. Before you import

- [ ] System is S/4HANA 2025 (SAP_BASIS 816). Record the exact FPS/SP in `BATCH_REPORT.md`.
- [ ] Package `ZEAM_VDM` (or the customer package) exists, with a transport request.
- [ ] abapGit (standalone `ZABAPGIT` report or the ADT plug-in) is installed. For the ADT route see `ADT_SETUP.md`.
- [ ] Every SAP view the selected modules list under `sap_released_views` exists and is
      released for use in key-user / developer extensibility (C1). Open each in ADT
      (*Open ABAP Development Object*, Ctrl+Shift+A) and compare its element list with
      the elements we use. **Do this first; it settles most HIGH items in `BATCH_REPORT.md`.**

| Module | SAP views to check |
|---|---|
| equipment | `I_Equipment`, `I_EquipmentText`, `I_Plant`, `I_CompanyCode`, `I_EquipmentCategory`, `I_TechnicalObjectType` |
| functional_location | `I_FunctionalLocation`, `I_FunctionalLocationText`, `I_Plant`, `I_CompanyCode`, `I_FunctionalLocationCategory`, `I_TechnicalObjectType` |

- [ ] Check that `I_Equipment` and `I_FunctionalLocation` have access control roles, and
      write down the elements those roles use (needed for EQ-D01 / FL-D01).

## 1. Batch 1 - Equipment, Functional Location, links

Activate in this order. The steps are ordered so that each object comes after the objects
it depends on. Mass activation of a whole group also works. Text views and dimension views
reference each other through associations, so activate them together if one fails on its own.

### Data definitions (DDLS)

| # | Object | Module | Depends on | Status |
|---|---|---|---|---|
| 1 | `ZEAM_I_EquipmentText` | equipment | I_EquipmentText | [ ] |
| 2 | `ZEAM_I_Equipment` | equipment | I_Equipment, #1, I_Plant, I_CompanyCode, I_EquipmentCategory, I_TechnicalObjectType | [ ] |
| 3 | `ZEAM_R_Equipment` | equipment | #2 | [ ] |
| 4 | `ZEAM_C_EquipmentQ` | equipment | #3 | [ ] |
| 5 | `ZEAM_I_FuncLocText` | functional_location | I_FunctionalLocationText | [ ] |
| 6 | `ZEAM_I_FuncLoc` | functional_location | I_FunctionalLocation, #5, I_Plant, I_CompanyCode, I_FunctionalLocationCategory, I_TechnicalObjectType | [ ] |
| 7 | `ZEAM_R_FuncLoc` | functional_location | #6 | [ ] |
| 8 | `ZEAM_C_FuncLocQ` | functional_location | #7 | [ ] |
| 9 | `ZEAM_I_EquipmentVH` | equipment | #2 (+ #1 via `_Text`) | [ ] |
| 10 | `ZEAM_I_EquipmentWithFuncLoc` | **link** | #2, #6 | [ ] |
| 11 | `ZEAM_I_FuncLocVH` | functional_location | #6 (+ #5 via `_Text`) | [ ] |
| 12 | `ZEAM_I_FuncLocWithEquipment` | **link** | #6, #2 | [ ] |

### Access controls (DCLS)

An inheriting role needs the role it inherits from to be active first.

| # | Object | Inherits from | Status |
|---|---|---|---|
| 13 | `ZEAM_I_Equipment` | SAP role of `I_Equipment` | [ ] |
| 14 | `ZEAM_I_EquipmentText` | - (unrestricted) | [ ] |
| 15 | `ZEAM_I_EquipmentVH` | `ZEAM_I_Equipment` | [ ] |
| 16 | `ZEAM_I_EquipmentWithFuncLoc` | `ZEAM_I_Equipment` | [ ] |
| 17 | `ZEAM_I_FuncLoc` | SAP role of `I_FunctionalLocation` | [ ] |
| 18 | `ZEAM_I_FuncLocText` | - (unrestricted) | [ ] |
| 19 | `ZEAM_I_FuncLocVH` | `ZEAM_I_FuncLoc` | [ ] |
| 20 | `ZEAM_I_FuncLocWithEquipment` | `ZEAM_I_FuncLoc` | [ ] |
| 21 | `ZEAM_R_Equipment` | `ZEAM_I_Equipment` | [ ] |
| 22 | `ZEAM_R_FuncLoc` | `ZEAM_I_FuncLoc` | [ ] |

`ZEAM_C_EquipmentQ` and `ZEAM_C_FuncLocQ` have **no** DCL by design (transient analytical
queries; see GEN-Q01).

### Metadata extensions (DDLX)

| # | Object | Status |
|---|---|---|
| 23 | `ZEAM_R_Equipment` | [ ] |
| 24 | `ZEAM_R_FuncLoc` | [ ] |

### Tests (CLAS, only with `--with-tests`)

| # | Object | Status |
|---|---|---|
| 25 | `ZEAM_CL_EQUIPMENT_TEST` | [ ] activated [ ] ABAP Unit green |
| 26 | `ZEAM_CL_FUNCLOC_TEST` | [ ] activated [ ] ABAP Unit green |

### Functional smoke checks after activation

- [ ] Data preview (F8) on `ZEAM_I_Equipment` returns one row per equipment, and the row count equals `SELECT COUNT(*) FROM equi`.
- [ ] Data preview on `ZEAM_I_EquipmentVH` shows descriptions in the logon language.
- [ ] A user without plant authorization sees fewer rows in `ZEAM_I_Equipment` than an admin (DCL is active).
- [ ] Run `ZEAM_C_EquipmentQ` / `ZEAM_C_FuncLocQ` in transaction `RSRTS_ODP_DIS` or in an analytical preview of a service binding.
- [ ] Data preview on `ZEAM_I_EquipmentWithFuncLoc`: `FunctionalLocationLabelName` is filled.
- [ ] ATC run on package `ZEAM_VDM` with the customer's check variant. Record findings in `BATCH_REPORT.md`.

## 2. After a successful activation

1. Fix every error **in this git repository**, never only in the system. Then re-run
   `abaplint`, `tools/validate_repo.py` and `tools/todo_verify_report.py`.
2. Remove the `TODO-VERIFY` marker of every item that was confirmed, and record the result
   in `BATCH_REPORT.md` under *Verification log*.
3. Set `status` in each `module.json` to `activated` (or `tested` once ABAP Unit and the smoke
   checks pass), and set `tested_release` to the exact release, e.g.
   `S/4HANA 2025 FPS01 (SAP_BASIS 816 SP01)`. Also remove `"phase": "no-system"` from
   `library.json`.
