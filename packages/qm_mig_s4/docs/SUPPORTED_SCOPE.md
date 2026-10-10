# Supported scope

Quality Management has 4 modules and 15 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Inspection lots | inspection_lot | 2 | process-reference |
| Inspection results | inspection_result | 3 | reference |
| Quality notifications | quality_notification | 5 | process-reference |
| Inspection plan reference | inspection_plan | 5 | effectivity-reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/qm; they are not duplicated as migration payloads.

Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.
