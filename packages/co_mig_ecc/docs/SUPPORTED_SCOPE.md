# Supported scope

Controlling has 7 modules and 13 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Allocation cycles and segments | allocation_cycle | 2 | configuration-reference |
| CO primary and secondary cost planning | planning | 2 | planning-reference |
| Cost centers | cost_center | 2 | master |
| Profit centers | profit_center | 2 | master |
| Internal orders | internal_order | 2 | master |
| Actual cost history | cost_actuals | 1 | reference |
| Cost element references | cost_element | 2 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/co; they are not duplicated as migration payloads.

Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### CO primary and secondary cost planning (`planning`)

COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.

### Allocation cycles and segments (`allocation_cycle`)

Cycle headers and segments alone are insufficient. Export sender/receiver rules, set membership, tracing factors, accounts, plan/actual context, iterations and company restrictions through the verified native cycle configuration export. T811* table categories and keys vary; use the full-row helper where CDS is unavailable. Do not insert T811* or recreate cycles by posting journal entries; validate and execute a test cycle in the target.
