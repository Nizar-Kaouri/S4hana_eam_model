# Supported scope

Controlling has 5 modules and 9 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Cost centers | cost_center | 2 | master |
| Profit centers | profit_center | 2 | master |
| Internal orders | internal_order | 2 | master |
| Actual cost history | cost_actuals | 1 | reference |
| Cost element references | cost_element | 2 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/co; they are not duplicated as migration payloads.

Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.
