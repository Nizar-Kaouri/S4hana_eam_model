# Supported scope

Production Planning has 4 modules and 15 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Production orders | production_order | 3 | process-reference |
| Production order operations | production_order_operation | 3 | process-reference |
| Material bills of material | bill_of_material | 4 | effectivity-reference |
| Routing reference | routing | 5 | effectivity-reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/pp; they are not duplicated as migration payloads.

BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.
