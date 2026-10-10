# Known limitations of candidate 0.3.1

This is an activation and customer acceptance candidate, not a validated SAP release. No SAP system was available for this review. OPEN_CHECKS.md contains outstanding checks for the delivered objects; passing offline gates does not resolve those checks.

- Confirm all table fields, keys, types and released-view elements on your exact system. Prioritize IHSG permit fields, EQBS serial stock fields, IFLOS labels and CRCA/KAKO capacity references.
- EAPL equipment and TAPL functional-location task-list allocations are delivered as version ledgers. Resolve additional criteria, assignment counters and deletion states for cutover. The draft no longer assumes EAPL contains functional locations.
- Task-list operation/component/PRT/package helpers use the greatest recorded counter. Confirm effective dates, future changes, sequences, suboperations and deleted states before loading.
- Equipment time slices and current task-list headers require cutover verification. BOMs preserve history rather than resolve engineering-change effectivity.
- The last measurement reading is selected by reading date, time and document ID, excluding cancellations. Filter readings to the selected measuring-point population and exclude dates beyond the agreed cutover.
- Full capacity intervals/shifts/formulas, operation relationships/service packages, object dependencies and other specialized extensions are not complete migration payloads.
- Long-text rows are indexes. READ_TEXT and target text posting are customer implementation work.
- Status, partners and long texts require a migrated-object cohort filter. Their global extracts can include objects outside the migration.
- The S/4HANA companion provides main-object comparisons for eight modules. It does not reconcile all child structures or all fourteen source modules. Record child validation separately.
- Filter the target to the migrated cohort before aggregating counts. Source open/deletion filters and target all-record exports are not automatically equivalent; unrelated existing target rows must be excluded explicitly.
- Mappings describe provisional table fields. Choose and test supported target posting APIs/BAPIs; do not use them as direct table-write instructions.

SAP confirms the TAPL functional-location allocation source in [PM functional-location task-list migration](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/6a850a18d1834d24b2af1e45b4eb457a.html). This confirms the source-table split, not every field or release assumption in this candidate.
