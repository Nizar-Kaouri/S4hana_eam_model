// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cost center with a to-many association to the internal orders it is responsible for.
// Example: Internal orders of a cost center manager.
// LINK VIEW (ships only when modules "cost_center" AND "internal_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Cost Center with Internal Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CostCenter'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZCOV_I_CostCenterWithOrders
  as select from ZCOV_I_CostCenter
  association [0..*] to ZCOV_I_InternalOrder as _InternalOrder on $projection.ControllingArea = _InternalOrder.ControllingArea
    and $projection.CostCenter = _InternalOrder.ResponsibleCostCenter
{
  key ControllingArea,
  key CostCenter,
      CompanyCode,
      CostCenterCategory,
      ProfitCenter,

      /* Associations */
      _InternalOrder
}
