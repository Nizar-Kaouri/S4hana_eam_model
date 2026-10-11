# Public native evidence — research 2026-10-11

Documentary field usage is distinct from exact DDIC key flags, installed application release and SAP runtime verification. SAP Community examples are firsthand code/technical discussion, not released SAP contracts.

## StorageBin — NATIVE_DRAFT

EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics.

https://help.sap.com/saphelp_ewm700_ehp02/helpdata/en/47/d1d47a2297467886e0962fa13c6312/content.htm

## BinSorting — NATIVE_DRAFT

SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation.

https://help.sap.com/saphelp_ewm700_ehp02/helpdata/en/47/d1d47a2297467886e0962fa13c6312/content.htm

## WarehouseProd — PENDING

MATLWH keys MANDT/MATID/SCUGUID/ENTITLED_ID documented; MATKEY supplies MATNR/MEINS. Warehouse control payload, full joined DDIC validation and target-release semantics still unresolved; no identity-only view substituted for a warehouse product.

https://help.sap.com/docs/SUPPORT_CONTENT/sapo/3354623184.html

## FixedBin — PENDING

Fixed-bin functionality documented; exact physical keys, minimum/maximum quantities and unit references not established.

https://help.sap.com/saphelp_ewm900/helpdata/en/d1/58a5ef3b6a427eab5e7cc9bad16b96/content.htm

## WarehouseStock — PENDING

Stock extractor joins indexed stock representations. Physical-stock versus available-stock grain, HU/product references and quantity/unit roles need explicit native definitions; no flattened stock-table assumption.

https://help.sap.com/saphelp_ewm900/helpdata/en/0a/782e35aa9b499ab5e9dd30b1448280/content.htm

## StockSerial — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## HandlingUnit — PENDING

GUID_HU and object references documented; complete header payload and content key/reference definitions unresolved.

https://help.sap.com/docs/SUPPORT_CONTENT/sewm/4248188925.html

## HUContent — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## WarehouseTask — NATIVE_DRAFT

Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation.

https://help.sap.com/docs/signavio-process-insights/administration-guide/be4b0a35f6d048eb979899f569509c78.html

https://community.sap.com/t5/supply-chain-management-q-a/how-to-confirm-the-status-of-picking-and-packing-in-sap-ewm/qaq-p/595791


## TaskConfirm — NATIVE_DRAFT

Confirmed tasks only, retaining TAPOS. Open tasks are delivered separately at LGNUM/TANUM grain. Quantity and serial payload remain pending.

https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/9832125c23154a179bfa1784cdc9577a/4fa06705fc52617be10000000a42189c.html

## WarehouseOrder — NATIVE_DRAFT

All native warehouse-order records; customer must approve process state and cutover scope.

https://help.sap.com/docs/SAP_EXTENDED_WAREHOUSE_MANAGEMENT/3d97bec9bf1649099384bb8167df3cf2/4fa066b2fc52617be10000000a42189c.html?locale=de-DE

## WhDelivery — NATIVE_DRAFT

Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.

https://help.sap.com/doc/saphelp_aii710/7.1/en-US/47/df5e7f01394b20af3234922578d1e4/content.htm?no_cache=true

## WhDeliveryItem — NATIVE_DRAFT

Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending.

https://help.sap.com/doc/saphelp_aii710/7.1/en-US/47/df5e7f01394b20af3234922578d1e4/content.htm?no_cache=true

## PackSpec — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## PackLevel — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## PackElement — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
