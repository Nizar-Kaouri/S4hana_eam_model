# Known limitations

Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

All raw source grain and target CDS fields are candidates pending system verification. Supporting structures have CSV contracts, not invented released SAP views. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work. These draft packages must pass the customer acceptance test before sale as validated packages.

## Coverage additions — 0.2.0

### Master inspection characteristics (`master_inspection_characteristic`)

Retain plant, characteristic, version and language. Verify released status, quantitative/qualitative control indicators, limits, units, inspection methods and catalog/selected-set dependencies in full-row export. Short texts are included; long texts need the native text API. Do not infer active version solely from greatest version number.

### Sampling procedures (`sampling_procedure`)

DDIC must verify QDSV keys and the selected sampling/valuation fields. A procedure also depends on sample size rules, sampling schemes, dynamic modification and valuation settings; export those through the native QM configuration interface and verify the complete dependency set. Sampling procedure headers alone are not a complete statistical sampling scheme.
