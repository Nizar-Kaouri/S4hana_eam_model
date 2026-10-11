// ModuPorter QM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZQMX_65N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'NotifStatusMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_NotifStatusMig
  as select from ZQMX_I_NotifStatus as src
{
key src.QualityNotification as QualityNotification,
  key src.StatusCode as StatusCode,
      src.ObjectNumber as ObjectNumber,
      src.StatusKind as StatusKind,
      src.StatusChangeNumber as StatusChangeNumber
}
