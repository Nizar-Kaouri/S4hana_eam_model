# Known limitations

Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

All raw source grain and target CDS fields are candidates pending system verification. Supporting structures have CSV contracts, not invented released SAP views. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work. These release packages must pass the customer acceptance test before sale as validated packages.

## Coverage additions — 0.2.0

### Project networks and activities (`network`)

AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

### Project overall and annual budgets (`budget`)

Separate original budget, supplements, returns, releases and transfers by verified value type and transaction semantics; do not sum all BPGE/BPJA rows as available budget. Currency, object ownership, fiscal year and availability-control settings must be enriched and approved. Reconcile overall and annual budget separately through a supported budget interface.

### Project commitments (`commitment`)

COOI grain and fields must be confirmed from DDIC before extraction. Tie commitments to approved PR/PO items and their remaining obligations. Commitments are generally regenerated from migrated purchasing documents: never post both a commitment history and its purchasing source. Enrich object and controlling-area currencies before monetary checks.

### Investment programs and measures (`investment_measure`)

Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.
