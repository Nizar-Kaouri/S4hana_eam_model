// ModuPorter PS migration | Release 1.0.0
// Purpose: Read Project as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Project'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_Project
  as select from ZPSX_I_ProjectData as src
{
  key src.ProjectInternalID as ProjectInternalID,
      src.ProjectExternalID as ProjectExternalID,
      src.ProjectDescription as ProjectDescription,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea,
      src.ObjectNumber as ObjectNumber
}
