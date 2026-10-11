// ModuPorter QM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZQMX_62N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'LotStatusMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_LotStatusMig
  as select from ZQMX_I_LotStatus as src
{
key src.InspectionLot as InspectionLot,
  key src.StatusCode as StatusCode,
      src.ObjectNumber as ObjectNumber,
      src.StatusKind as StatusKind,
      src.StatusChangeNumber as StatusChangeNumber,
      src.StatusProfile as StatusProfile
}
