# Compatibility

All objects are draft-unverified. Source baseline: ECC 6.0 on NetWeaver 7.40 SP08 or later with classic CDS; database/table transparency and customer DDIC may limit it. Target baseline: S/4HANA 2025 on premise or Private Cloud, with candidate released CDS projections. Public Cloud deployment is not assumed. No semantic DDIC or SAP activation test has run. Target CSV adapters must be implemented against customer-supported interfaces.

Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
