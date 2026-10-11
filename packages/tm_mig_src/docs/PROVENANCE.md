# Public native evidence — research 2026-10-11

Documentary field usage is distinct from exact DDIC key flags, installed application release and SAP runtime verification. SAP Community examples are firsthand code/technical discussion, not released SAP contracts.

## TransportLoc — NATIVE_DRAFT

Internal location UUID is preserved. Address, location type and time zone payload remain pending.

https://help.sap.com/docs/SUPPORT_CONTENT/sapo/3354623172.html

## TransportRes — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## ResCapacity — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## TransportLane — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## LaneCarrier — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## Schedule — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## ScheduleStop — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## FreightAgree — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## FreightRate — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## FreightScale — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## FreightUnit — NATIVE_DRAFT

TOR root plus separately delivered native item/stop drafts; quantities, route traversal, stages and freight bookings remain pending. Verify category and lifecycle scope.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

## FreightUnitItem — NATIVE_DRAFT

Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html
https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402

## FreightUnitStop — NATIVE_DRAFT

Native TOR stops filtered through the parent category FU. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.

https://community.sap.com/t5/supply-chain-management-q-a/where-to-to-find-fo-stops-order-sequence-in-database-data/qaa-p/12558182
https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402

## FreightOrder — NATIVE_DRAFT

TOR root plus separately delivered native item/stop drafts; quantities, route traversal, stages and freight bookings remain pending. Verify category and lifecycle scope.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

## FreightOrdItem — NATIVE_DRAFT

Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html
https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402

## FreightOrdStop — NATIVE_DRAFT

Native TOR stops filtered through the parent category TO. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.

https://community.sap.com/t5/supply-chain-management-q-a/where-to-to-find-fo-stops-order-sequence-in-database-data/qaa-p/12558182
https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402

## FreightStage — PENDING

STOP_SUCCESSOR existence documented. Exact predecessor/successor native fields, keys and stage interpretation unresolved; STOP_ID order is not a substitute.

https://community.sap.com/t5/enterprise-resource-planning-q-a/tm-link-between-scmtms-d-torrot-and-scmtms-d-trqstg/qaq-p/13793149

## FreightSettle — PENDING

Native settlement-root table and several attributes documented; full key schema, amount/currency relations and settlement item joins still unresolved.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

## SettleItem — PENDING

Settlement item schema and root relationship require native field/key evidence. No guessed SFIR table names used.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html
