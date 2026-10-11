# Supported scope

ModuPorter Quality Management version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Inspection lots | inspection_lot | 3 |
| Inspection plan reference | inspection_plan | 5 |
| Inspection results | inspection_result | 3 |
| Master inspection characteristics | master_inspection_characteristic | 2 |
| Quality notifications | quality_notification | 6 |
| Sampling procedures | sampling_procedure | 1 |

## Delivery boundaries

Read-only extraction and comparison templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Quality Management has 6 modules and 18 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Sampling procedures | sampling_procedure | 1 | configuration-reference |
| Master inspection characteristics | master_inspection_characteristic | 2 | master |
| Inspection lots | inspection_lot | 3 | process-reference |
| Inspection results | inspection_result | 3 | reference |
| Quality notifications | quality_notification | 6 | process-reference |
| Inspection plan reference | inspection_plan | 5 | effectivity-reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/qm; they are not duplicated as migration payloads.

Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### Master inspection characteristics (`master_inspection_characteristic`)

Retain plant, characteristic, version and language. Verify released status, quantitative/qualitative control indicators, limits, units, inspection methods and catalog/selected-set dependencies in full-row export. Short texts are included; long texts need the native text API. Do not infer active version solely from greatest version number.

### Sampling procedures (`sampling_procedure`)

DDIC must verify QDSV keys and the selected sampling/valuation fields. A procedure also depends on sample size rules, sampling schemes, dynamic modification and valuation settings; export those through the native QM configuration interface and verify the complete dependency set. Sampling procedure headers alone are not a complete statistical sampling scheme.

Master and child preparation follows MASTER_CHILD_ARCHITECTURE.md; full source keys and selected parent populations are preserved.
