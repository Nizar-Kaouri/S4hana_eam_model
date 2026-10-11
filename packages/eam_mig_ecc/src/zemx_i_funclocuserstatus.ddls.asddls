// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_184N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocUserStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLocUserStatus
  as select from ZEMX_I_FuncLocStatus as src
{
  key src.FunctionalLocation as FunctionalLocation,
  key src.StatusCode as StatusCode,
      src.StatusKind as StatusKind,
      src.StatusProfile as StatusProfile,
      src.StatusChangeNumber as StatusChangeNumber
}
where src.StatusKind = 'E'
