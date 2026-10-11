// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_67N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DlvItemStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_DlvItemStatus
  as select from ZSDX_B_DlvItemStatusData as ch
    inner join ZSDX_I_DeliveryItem as obj on ch.DeliveryDocument = obj.DeliveryDocument and ch.DeliveryDocumentItem = obj.DeliveryDocumentItem
{
  key ch.DeliveryDocument as DeliveryDocument,
  key ch.DeliveryDocumentItem as DeliveryDocumentItem,
      ch.OverallProcessingStatus as OverallProcessingStatus,
      ch.GoodsMovementStatus as GoodsMovementStatus,
      ch.PickingStatus as PickingStatus,
      ch.BillingStatus as BillingStatus
}
