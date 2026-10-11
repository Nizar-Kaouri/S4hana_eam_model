# Material and batch classification

Native KSSK/KLAH and AUSP/CABN -> B -> I -> C retain full classified-object,
class, characteristic, value-position, class-type and ECM-counter identities.
INOB is exported separately to resolve internal CUOBJ against native object
table/key. The customer project scopes the exports through explicit full-key
owner links to prepared materials (001) and material-level batches (023).
Use actual source classification metadata to populate classification-links.
For plant-level batch classification, configure the appropriate class type,
prepared BatchPlant parent and Product/Plant/Batch link keys; do not silently
mix batch levels or assume all source systems use the same batch configuration.

Resolve class and characteristic names before loading. Existing target class
definitions, units and characteristic configuration are prerequisites. Preserve
numeric value intervals and ECM counters; evaluate cutover effectivity rather
than choosing the largest counter indiscriminately. The full-row helper includes
KLAH, CABN, INOB, KSSK and AUSP for release-specific fields. No custom staging
table or application-table write is introduced. Native source identities are
mapped to target business objects through supported classification interfaces.

[SAP batch classification integrity and INOB/KSSK/AUSP](https://help.sap.com/docs/SAP_ERP/3db8848948314edeabbea684714e1055/95fdb753128eb44ce10000000a174cb4.html).
