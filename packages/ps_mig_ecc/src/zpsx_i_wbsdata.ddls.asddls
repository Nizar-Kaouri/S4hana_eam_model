// ModuPorter PS migration | Release 1.0.0
// Purpose: Read WBSData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_WBSData
  as select from prps as src
{
  key src.pspnr as WBSElementInternalID,
      src.posid as WBSElementExternalID,
      src.post1 as WBSElementDescription,
      src.psphi as ProjectInternalID,
      src.pbukr as CompanyCode,
      src.pkokr as ControllingArea,
      src.objnr as ObjectNumber
}
