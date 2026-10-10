# Compatibility

All objects are draft-unverified. Source baseline: ECC 6.0 on NetWeaver 7.40 SP08 or later with classic CDS; database/table transparency and customer DDIC may limit it. Target baseline: S/4HANA 2025 on premise or Private Cloud, with candidate released CDS projections. Public Cloud deployment is not assumed. No semantic DDIC or SAP activation test has run. Target CSV adapters must be implemented against customer-supported interfaces.

Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
