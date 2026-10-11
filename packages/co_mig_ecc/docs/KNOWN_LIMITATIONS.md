# Customer implementation requirements

Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

Use the supplied CSV contracts for the documented source structures. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work.

## Coverage additions — 0.2.0

### CO primary and secondary cost planning (`planning`)

COSP/COSS also contain actuals: approve the plan value types and versions explicitly. Preserve period blocks, periods 01–16, fiscal-year variant, controlling/object/transaction currencies and debit-credit semantics. Resolve cost objects and accounts first. Target ACDOCP planning is not a field-for-field copy of these totals; choose a supported plan import and map period/currency types.

### Allocation cycles and segments (`allocation_cycle`)

Cycle headers and segments alone are insufficient. Export sender/receiver rules, set membership, tracing factors, accounts, plan/actual context, iterations and company restrictions through the verified native cycle configuration export. T811* table categories and keys vary; use the full-row helper where CDS is unavailable. Do not insert T811* or recreate cycles by posting journal entries; validate and execute a test cycle in the target.
