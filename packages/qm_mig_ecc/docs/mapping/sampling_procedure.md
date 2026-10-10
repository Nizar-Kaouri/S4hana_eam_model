# Migration interface: sampling_procedure

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** Customer-verified business interface; configuration-reference restrictions apply
- **Load after:** - (first level)
- **Business key:** `SamplingProcedure` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZQMX_C_SamplingProcMig`

- Source: `ZQMX_I_SamplingProc`
- Keys: `SamplingProcedure`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions. DDIC must verify QDSV keys and the selected sampling/valuation fields. A procedure also depends on sample size rules, sampling schemes, dynamic modification and valuation settings; export those through the native QM configuration interface and verify the complete dependency set. Sampling procedure headers alone are not a complete statistical sampling scheme.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SamplingProcedure` | QDSV-STICHPRVER | customer interface field: SamplingProcedure (unconfirmed) | information only | yes |
| `SamplingType` | QDSV-STICHPRART | customer interface field: SamplingType (unconfirmed) | information only | yes |
| `ValuationMode` | QDSV-BEWERTART | customer interface field: ValuationMode (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZQMX_C_SamplingProcMigCount` (ECC) vs `-` (S/4HANA) per `SamplingProcedure`

```bash
python3 tools/mig_reconcile.py counts --product qm_mig_ecc --module sampling_procedure --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
- DDIC must verify QDSV keys and the selected sampling/valuation fields. A procedure also depends on sample size rules, sampling schemes, dynamic modification and valuation settings; export those through the native QM configuration interface and verify the complete dependency set. Sampling procedure headers alone are not a complete statistical sampling scheme.
