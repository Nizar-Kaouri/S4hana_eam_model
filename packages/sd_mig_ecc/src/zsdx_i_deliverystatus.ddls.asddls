// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_64N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_DeliveryStatus
  as select from ZSDX_B_DeliveryStatusData as ch
    inner join ZSDX_I_Delivery as obj on ch.DeliveryDocument = obj.DeliveryDocument
{
  key ch.DeliveryDocument as DeliveryDocument,
      ch.OverallProcessingStatus as OverallProcessingStatus,
      ch.GoodsMovementStatus as GoodsMovementStatus,
      ch.PickingStatus as PickingStatus,
      ch.BillingStatus as BillingStatus
}
