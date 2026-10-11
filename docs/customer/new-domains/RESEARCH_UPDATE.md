# Native documentary research update 0.3.0

Research date: 11 October 2026. Original three-layer architecture retained. No new business modules, staging tables or posting adapters added.

Ten additional native structure drafts were implemented: open EWM tasks, inbound delivery headers/items, FU/FO items/stops, credit exposure, incident roots and action roots. Existing payment promise/dispute attributes were extended with documented stored-currency amounts.

Public SAP Help extractor mappings establish native field origins, while some outputs are computed or resolved from other nodes. Those derived outputs were not assumed to be physical columns. SAP Community source examples establish candidate UUID keys/joins; they do not certify customer DDIC or release availability.

Current delivery: 27 native structure drafts, 45 pending structures, 140 CDS objects. Every native draft remains SAP-unverified and can still have missing payload.

Important boundaries: inbound delivery projections do not include outbound data or role-qualified quantities; open tasks do not inherit confirmed-task TAPOS; TM stops do not imply ordered routes; EHSM action roots need reference resolution before being treated as incident-only children; exposure is a stored-currency snapshot, not a delta or consolidated report.

Offline evidence: all 36 product checks passed; the eight modified products were checked again after edits; 88 shared unit tests passed. Synthetic isolated-ZIP tests verify selection/comparison only. No SAP system was available for activation, keys, authorization or business acceptance.

## Added source evidence

### EWM WarehouseTask

/SCWM/ORDIM_O — Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

### EWM WhDelivery

/SCDL/DB_PROCH_I — Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.

https://help.sap.com/doc/saphelp_aii710/7.1/en-US/47/df5e7f01394b20af3234922578d1e4/content.htm?no_cache=true

### EWM WhDeliveryItem

/SCDL/DB_PROCI_I — Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending.

https://help.sap.com/doc/saphelp_aii710/7.1/en-US/47/df5e7f01394b20af3234922578d1e4/content.htm?no_cache=true

### TM FreightUnitItem

/SCMTMS/D_TORITE — Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

### TM FreightUnitStop

/SCMTMS/D_TORSTP — Native TOR stops filtered through the parent category FU. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.

https://community.sap.com/t5/supply-chain-management-q-a/where-to-to-find-fo-stops-order-sequence-in-database-data/qaa-p/12558182

### TM FreightOrdItem

/SCMTMS/D_TORITE — Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

### TM FreightOrdStop

/SCMTMS/D_TORSTP — Native TOR stops filtered through the parent category TO. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.

https://community.sap.com/t5/supply-chain-management-q-a/where-to-to-find-fo-stops-order-sequence-in-database-data/qaa-p/12558182

### FSCM CreditExposure

UKM_TOTALS — Native liability snapshot in stored currency; not a delta feed or posting payload. Declared grain including currency is a DDIC candidate. Derived currency-type and message-party fields are excluded; cross-segment/report-currency aggregation remains pending.

https://help.sap.com/saphelp_SCM700_ehp01/helpdata/ru/cc/5c77197e5c49ba85e66aafaa1ea09a/content.htm?no_cache=true

### EHS Incident

EHHSSD_INC_ROOT — Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.

https://help.sap.com/docs/EHSM/c2db47abe44e4aa7ab1be93e4c20ae18/d9eb3c50906ea902e10000000a44176f.html

### EHS IncidentAction

EHHSSD_IAC_ROOT — Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.

https://help.sap.com/docs/EHSM/c2db47abe44e4aa7ab1be93e4c20ae18/55ea3c50906ea902e10000000a44176f.html?locale=en-US
