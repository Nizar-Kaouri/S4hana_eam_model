// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Stock quantity per material, plant, storage location, batch and stock type (unrestricted, quality
//   inspection, blocked) from the material document table.
// Example: Current spare-part stock per storage location; blocked and quality-inspection stock per plant.
// The SAP view aggregates material documents; the key below is not guaranteed to be unique (special stocks).
// TODO-VERIFY[H] MM-010: I_MaterialStock_2 exists, is released and has no mandatory parameters
// TODO-VERIFY[H] MM-011: elements InventoryStockType, InventorySpecialStockType, MatlWrhsStkQtyInMatlBaseUnit, MaterialBaseUnit
// TODO-VERIFY[M] MM-012: aggregation behaviour: one row per stock segment, or one row per material document (then the cube sums correctly anyway)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Material Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'InventorySpecialStockType'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZMMV_I_MaterialStock
  as select from I_MaterialStock_2
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
  key Product,
      @ObjectModel.foreignKey.association: '_Plant'
  key Plant,
  key StorageLocation,
  key Batch,
  key InventoryStockType,
  key InventorySpecialStockType,
      CompanyCode,
      MaterialBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlWrhsStkQtyInMatlBaseUnit,

      /* Associations */
      _Plant
}
