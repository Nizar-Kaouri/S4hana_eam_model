// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order components with the material master (product type, group, base unit, texts via the
//   product dimension).
// Example: Spare-part demand of maintenance orders by product group.
// LINK VIEW (ships only when modules "eam:maintenance_order" AND "mm:product" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order Component with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ReservationItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZBRG_B_OrderCompWithProduct
  as select from ZEAM_B_MaintOrderComponent
  association [0..1] to ZMMV_B_Product as _Product on $projection.Material = _Product.Product
{
  key Reservation,
  key ReservationItem,
      MaintenanceOrder,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      Plant,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,
      _Product.BaseUnit as ProductBaseUnit,

      /* Associations */
      _Product
}
