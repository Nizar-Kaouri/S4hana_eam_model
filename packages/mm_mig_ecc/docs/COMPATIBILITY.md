# Compatibility

All objects are draft-unverified. Source baseline: ECC 6.0 on NetWeaver 7.40 SP08 or later with classic CDS; database/table transparency and customer DDIC may limit it. Target baseline: S/4HANA 2025 on premise or Private Cloud, with candidate released CDS projections. Public Cloud deployment is not assumed. No semantic DDIC or SAP activation test has run. Target CSV adapters must be implemented against customer-supported interfaces.

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.
