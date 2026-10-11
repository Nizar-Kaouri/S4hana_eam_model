// ModuPorter PS migration | Release 1.0.0
// Purpose: Read ProjectData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_ProjectData
  as select from proj as src
{
  key src.pspnr as ProjectInternalID,
      src.pspid as ProjectExternalID,
      src.post1 as ProjectDescription,
      src.vbukr as CompanyCode,
      src.vkokr as ControllingArea,
      src.objnr as ObjectNumber
}
