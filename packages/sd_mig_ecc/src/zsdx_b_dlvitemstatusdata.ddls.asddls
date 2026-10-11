// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_66N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DlvItemStatusData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_DlvItemStatusData
  as select from vbup as src
{
  key src.vbeln as DeliveryDocument,
  key src.posnr as DeliveryDocumentItem,
      src.gbsta as OverallProcessingStatus,
      src.wbsta as GoodsMovementStatus,
      src.kosta as PickingStatus,
      src.fksta as BillingStatus
}
