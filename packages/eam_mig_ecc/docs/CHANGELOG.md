# Change log

## 0.3.0 draft — 2026-10-10

- Added an equipment_bom module: equipment assignments plus versioned header, selection and item ledgers.
- Added task-list component, PRT and maintenance-package structures.
- Added notification causes, tasks and activities.
- Added order settlement rules and permit assignments.
- Added functional-location alternative labels, equipment serial-stock context and work-center capacity references.
- Select task-list assignment and detail counters independently to remove historical cross-products; effectivity remains unverified.
- Reject duplicate record keys during reconciliation, including translation/normalization collisions.
- Make generated report paths portable across Windows/Linux.
- Include installation, compatibility, release notes and a selected-module field catalogue in customer ZIPs.

No SAP-tested status is implied by this version.

## 0.3.1 — customer activation candidate

- Preserved object types and assignment counters in extraction keys.
- Corrected task-list allocations to EAPL/TAPL with history retained.
- Selected latest measurement by reading date/time, then document ID.
- Rejected malformed CSV, missing headers and fractional/invalid counts; preserved exact integers and multiline fields.
- Scoped ZIP migration links to shipped modules and included open checks, DDIC field requirements and a customer acceptance guide.
- SAP activation remains unverified.

## 1.0.0-rc.1 — complete customer workflow candidate

Added auditable raw-ledger preparation, complete typed cohort contracts, generic child/raw reconciliation, nested service closure, DDIC/full-row and READ_TEXT reports, specialized-data inventories, runnable examples, supported-scope and intended commercial license. Retains system-unverified status pending customer trial.
