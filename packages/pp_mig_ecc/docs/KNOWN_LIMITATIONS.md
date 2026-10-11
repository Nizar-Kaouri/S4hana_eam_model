# Known limitations

BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

All raw source grain fields are candidates pending system verification. Supporting structures have CSV contracts, not invented released SAP views. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work. These release packages must pass the customer acceptance test before sale as validated packages.

## Coverage additions — 0.2.0

### Production versions (`production_version`)

Verify production-version validity, lot-size ranges, lock/check status and the effective BOM/task-list combination. Materials and plants are cross-domain prerequisites. Distinct production versions may intentionally overlap; evaluate availability for a version identity rather than rejecting every material-level overlap. REM planning levels require release-specific interface review.

### Production confirmations (`production_confirmation`)

Preserve confirmation/counter identity and reversal relationships; do not delete reversals and assume the remaining history is net yield. Target order/operation mapping and posting periods must be approved. Reposting confirmations can trigger backflush, goods movements, activity allocations and accounting; confirmation history is reference-only unless a supported process migration explicitly authorizes those effects.
