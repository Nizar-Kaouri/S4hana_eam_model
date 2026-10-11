// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_65N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'DeliveryStatusMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_DeliveryStatusMig
  as select from ZSDX_I_DeliveryStatus as src
{
  key src.DeliveryDocument as DeliveryDocument,
      src.OverallProcessingStatus as OverallProcessingStatus,
      src.GoodsMovementStatus as GoodsMovementStatus,
      src.PickingStatus as PickingStatus,
      src.BillingStatus as BillingStatus
}
