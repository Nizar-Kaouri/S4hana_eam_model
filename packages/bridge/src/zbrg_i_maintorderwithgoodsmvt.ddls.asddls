// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order with a to-many association to the goods movements (issues, returns) posted to it.
// Example: Spare parts actually issued to an order vs. its planned components.
// LINK VIEW (ships only when modules "eam:maintenance_order" AND "mm:goods_movement" are selected).
// TODO-VERIFY[M] BRG-003: goods issues to maintenance orders carry the order number in OrderID of I_MaterialDocumentItem_2 (see MM-022)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance Order with Goods Movements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZBRG_I_MaintOrderWithGoodsMvt
  as select from ZEAM_I_MaintOrder
  association [0..*] to ZMMV_I_GoodsMovement as _GoodsMovement on $projection.MaintenanceOrder = _GoodsMovement.OrderID
{
  key MaintenanceOrder,
      MaintenanceOrderType,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      CompanyCode,
      BusinessArea,
      CostCenter,

      /* Associations */
      _GoodsMovement
}
