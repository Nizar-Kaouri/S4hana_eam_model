// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order component cube enriched with product type and group.
// Example: Open spare-part quantities per product group and planning plant.
// LINK VIEW (ships only when modules "eam:maintenance_order" AND "mm:product" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Order Component Cube with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_I_OrderCompWithProduct
  as select from ZEAM_I_MaintOrderComponent
  association [0..1] to ZMMV_B_Product as _Product on $projection.Material = _Product.Product
{
  key Reservation,
  key ReservationItem,
      MaintenanceOrder,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      Plant,
      BaseUnit,
      MaintenanceOrderType,
      MaintenancePlanningPlant,
      MaintOrderIsOpen,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequirementQuantityInBaseUnit,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      WithdrawnQuantity,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      OpenQuantity,
      @Aggregation.default: #SUM
      NumberOfComponents,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,

      /* Associations */
      _Product
}
