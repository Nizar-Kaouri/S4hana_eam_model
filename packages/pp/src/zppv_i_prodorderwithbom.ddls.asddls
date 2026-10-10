// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Production order with a to-many association to the BOM assignments of its material in the production
//   plant.
// Example: Which BOM alternatives exist for the material of an order.
// LINK VIEW (ships only when modules "bill_of_material" AND "production_order" are selected).
// The association does not select the BOM alternative used by the order (production version logic).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Production Order with Material BOMs'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ManufacturingOrder'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZPPV_I_ProdOrderWithBOM
  as select from ZPPV_I_ProductionOrder
  association [0..*] to ZPPV_I_MaterialBOMLink as _MaterialBOM on $projection.Material = _MaterialBOM.Material
    and $projection.ProductionPlant = _MaterialBOM.Plant
{
  key ManufacturingOrder,
      Material,
      ProductionPlant,
      ProductionVersion,

      /* Associations */
      _MaterialBOM
}
