# Supported scope

ModuPorter Production Planning version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Material bills of material | bill_of_material | 5 |
| Production confirmations | production_confirmation | 1 |
| Production orders | production_order | 6 |
| Production order operations | production_order_operation | 3 |
| Production versions | production_version | 1 |
| Routing reference | routing | 6 |

## Delivery boundaries

Read-only source extraction templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Production Planning has 6 modules and 17 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Production confirmations | production_confirmation | 1 | process-reference |
| Production versions | production_version | 1 | effectivity-reference |
| Production orders | production_order | 6 | process-reference |
| Production order operations | production_order_operation | 3 | process-reference |
| Material bills of material | bill_of_material | 5 | effectivity-reference |
| Routing reference | routing | 6 | effectivity-reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/pp; they are not duplicated as migration payloads.

BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### Production versions (`production_version`)

Verify production-version validity, lot-size ranges, lock/check status and the effective BOM/task-list combination. Materials and plants are cross-domain prerequisites. Distinct production versions may intentionally overlap; evaluate availability for a version identity rather than rejecting every material-level overlap. REM planning levels require release-specific interface review.

### Production confirmations (`production_confirmation`)

Preserve confirmation/counter identity and reversal relationships; do not delete reversals and assume the remaining history is net yield. Target order/operation mapping and posting periods must be approved. Reposting confirmations can trigger backflush, goods movements, activity allocations and accounting; confirmation history is reference-only unless a supported process migration explicitly authorizes those effects.

Master and child preparation follows MASTER_CHILD_ARCHITECTURE.md; full source keys and selected parent populations are preserved.
