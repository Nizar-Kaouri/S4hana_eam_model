// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProjectData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
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
