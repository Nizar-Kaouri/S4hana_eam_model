// ModuPorter QM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZQMX_70N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LotUserStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_LotUserStatus
  as select from ZQMX_I_LotStatus as src
{
  key src.InspectionLot as InspectionLot,
  key src.StatusCode as StatusCode,
      src.ObjectNumber as ObjectNumber,
      src.StatusKind as StatusKind,
      src.StatusChangeNumber as StatusChangeNumber,
      src.StatusProfile as StatusProfile
}
where src.StatusKind = 'E'
