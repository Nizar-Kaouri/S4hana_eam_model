# Compatibility

All objects are draft-unverified. Source baseline: ECC 6.0 on NetWeaver 7.40 SP08 or later with classic CDS; database/table transparency and customer DDIC may limit it. Target baseline: S/4HANA 2025 on premise or Private Cloud, with candidate released CDS projections. Public Cloud deployment is not assumed. No semantic DDIC or SAP activation test has run. Target CSV adapters must be implemented against customer-supported interfaces.

BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
