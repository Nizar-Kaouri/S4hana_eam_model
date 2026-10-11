// ModuPorter CO migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZCOX_48N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'OrderStatusMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_OrderStatusMig
  as select from ZCOX_I_OrderStatus as src
{
key src.InternalOrder as InternalOrder,
  key src.StatusCode as StatusCode,
      src.ObjectNumber as ObjectNumber,
      src.StatusKind as StatusKind,
      src.StatusChangeNumber as StatusChangeNumber
}
