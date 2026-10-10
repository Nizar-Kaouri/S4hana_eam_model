# ModuPorter EWM TM FSCM EHS migration drafts

Version 0.1.0. The four new packs contain 32 modules, 72 canonical export structures, 726 fields, 352 CDS views and 144 customer staging tables. They use separate `<domain>_mig_src` and `<domain>_mig_s4` products. EAM and the earlier eight non-EAM packs remain separate.

Native source adapters and business object posting adapters require implementation for the selected application and release. The supplied JSON files are contracts, not working connectors. Source CDS views project customer staging, while target CDS views project staged target evidence. Importing staging rows is not a business migration. No SAP activation or runtime test has been performed.

Read the English or German manual, run the synthetic customer examples, approve scope, test staging metadata and behavior in an authorized administrative client, implement supported native adapters, and retain actual business acceptance evidence. Production selection files are empty by default. The stage load report defaults to simulation and accepts only delivered customer staging tables.

The new-domain VDM map shows all 496 delivered CDS/table objects. The all-domain map combines the twelve non-EAM domain pairs (966 CDS/table objects); it excludes EAM and analytics. The catalogs are explicit scope lists, not a promise of every SAP feature, interface or industry solution.

See the per-product docs/PROVENANCE.md files for primary SAP references. Offline evidence and deliverable hashes are recorded in DELIVERY_MANIFEST.json. SAP test templates remain NOT_TESTED until real evidence is provided.
