# ModuPorter coverage additions

Version 0.2.0 extends the existing packs with 15 modules and 31 source structures.
All objects remain draft-unverified. EAM is a separate pack; no EAM CDS source was
changed by this extension. No new EWM, TM, FSCM, EHS or industry pack is included.

| Domain | New modules | New source structures |
|---|---|---:|
| PS | Networks and activities; overall/annual budgets; commitments; investment programs and measures | 10 |
| CO | Primary/secondary cost planning; allocation cycles and segments | 4 |
| FI | Bank master; classic/new G/L opening balances | 3 |
| MM | Purchasing info records; purchasing contracts and account assignments | 5 |
| PP | Production versions; production confirmations | 2 |
| QM | Master inspection characteristics and texts; sampling procedures | 3 |
| SD | Pricing condition headers, items, quantity scales and value scales | 4 |

Across the eight non-EAM migration pairs, the delivery now contains 47 modules,
129 source structures, 1164 mapped fields, 434 ECC CDS views and 36 target CDS
comparison/count candidates. Each source structure has a target CSV adapter
contract. New modules use those contracts; no new released target CDS interface
is claimed for them.

Each addition includes Basic → Composite → Consumption projections, separate
child structures, field mapping, dependency metadata, a candidate count view,
empty production selection CSVs, a synthetic preparation/comparison example,
bilingual instructions and explicit customer verification requirements.

## Interface boundaries

Configured pricing access tables must be exported through a verified native
interface and linked by condition-record number. KONH/KONP and scales alone
cannot establish the customer/material/organizational access key. This also
applies to purchasing conditions. Allocation sender/receiver rules and sets,
investment hierarchy and settlement configuration, and sampling schemes require
native configuration exports beyond the delivered candidate headers. Long texts
require the native SAP text interface. These extensions are explicitly described
in each module README, mapping and customer manual; they are not implemented
posting adapters.

Production confirmations and commitments are process/reference histories.
Reposting them can duplicate operational or financial effects. Budget and
planning value types, fiscal periods and currencies require approved contracts.
G/L opening balances must exclude balances already migrated through subledgers
or open items. Choose classic or new G/L per population, never both together.

## Customer DDIC preflight

Export the native table and its adjacent `.fields.csv` metadata with the supplied
full-row helper. Run from the extracted ECC ZIP:

```text
python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json
```

Missing fields, omitted native keys and non-native declared keys fail this check.
Only a typed MANDT may remain implicit in current-client scope. Correct the
candidate mapping and source before proceeding; field names and keys have not
been confirmed on a SAP system. A pass checks source metadata only, not target
support, activation, business eligibility or monetary meaning.

## Verification evidence

All 28 repository products passed generation, repository validation and ABAP
parser checks; migration sources also passed mapping validation. The shared
offline suite passed 77 tests, including missing native key detection and a
network-only customer ZIP with its dependencies and trimmed contracts.

The eight extracted ECC customer ZIPs ran the synthetic selection pipeline and
successful target comparisons for all 129 structures. Synthetic changed-value
and duplicate-key checks also passed. The interactive VDM map passed selection
checks for all 470 views, domain/system/search filters, English/German switching,
lineage and five viewport widths. Both seven-page Word handbooks were rendered
and every page inspected.

SAP activation, DDIC confirmation, business adapter implementation and trial
posting remain outstanding. Use customer/coverage-requirements.json and
customer/TEST_RESULTS.csv to record actual customer evidence.
