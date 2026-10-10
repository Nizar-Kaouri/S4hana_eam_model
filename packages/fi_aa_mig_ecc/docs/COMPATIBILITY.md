# Compatibility

All objects are draft-unverified. Source baseline: ECC 6.0 on NetWeaver 7.40 SP08 or later with classic CDS; database/table transparency and customer DDIC may limit it. Target baseline: S/4HANA 2025 on premise or Private Cloud, with candidate released CDS projections. Public Cloud deployment is not assumed. No semantic DDIC or SAP activation test has run. Target CSV adapters must be implemented against customer-supported interfaces.

Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.
