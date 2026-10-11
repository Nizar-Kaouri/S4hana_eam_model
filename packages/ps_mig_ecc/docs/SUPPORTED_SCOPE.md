# Supported scope

ModuPorter Project System version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Project overall and annual budgets | budget | 2 |
| Project commitments | commitment | 1 |
| Investment programs and measures | investment_measure | 3 |
| Project networks and activities | network | 10 |
| Projects | project | 6 |
| Project cost history | project_cost | 1 |
| WBS elements | wbs_element | 7 |

## Delivery boundaries

Read-only extraction and comparison templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Project System has 7 modules and 14 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Investment programs and measures | investment_measure | 3 | configuration-reference |
| Project commitments | commitment | 1 | reference |
| Project overall and annual budgets | budget | 2 | balance |
| Project networks and activities | network | 10 | process-reference |
| Projects | project | 6 | master |
| WBS elements | wbs_element | 7 | master |
| Project cost history | project_cost | 1 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/ps; they are not duplicated as migration payloads.

Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### Project networks and activities (`network`)

AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

### Project overall and annual budgets (`budget`)

Separate original budget, supplements, returns, releases and transfers by verified value type and transaction semantics; do not sum all BPGE/BPJA rows as available budget. Currency, object ownership, fiscal year and availability-control settings must be enriched and approved. Reconcile overall and annual budget separately through a supported budget interface.

### Project commitments (`commitment`)

COOI grain and fields must be confirmed from DDIC before extraction. Tie commitments to approved PR/PO items and their remaining obligations. Commitments are generally regenerated from migrated purchasing documents: never post both a commitment history and its purchasing source. Enrich object and controlling-area currencies before monetary checks.

### Investment programs and measures (`investment_measure`)

Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.

Master and child preparation follows MASTER_CHILD_ARCHITECTURE.md; full source keys and selected parent populations are preserved.
