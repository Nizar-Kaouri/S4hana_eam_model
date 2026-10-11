// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_68N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectUserStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_ProjectUserStatus
  as select from ZPSX_I_ProjectStatus as src
{
  key src.ProjectInternalID as ProjectInternalID,
  key src.StatusCode as StatusCode,
      src.ObjectNumber as ObjectNumber,
      src.StatusKind as StatusKind,
      src.StatusChangeNumber as StatusChangeNumber,
      src.StatusProfile as StatusProfile
}
where src.StatusKind = 'E'
