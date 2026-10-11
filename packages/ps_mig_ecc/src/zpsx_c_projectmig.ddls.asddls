// ModuPorter PS migration | Release 1.0.0
// Purpose: Read ProjectMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_ProjectMig
  as select from ZPSX_I_Project as src
{
  key src.ProjectInternalID as ProjectInternalID,
      src.ProjectExternalID as ProjectExternalID,
      src.ProjectDescription as ProjectDescription,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea,
      src.ObjectNumber as ObjectNumber
}
