// ModuPorter PS migration | Release 1.0.0
// Purpose: Read WBS as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBS'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_WBS
  as select from ZPSX_I_WBSData as src
{
  key src.WBSElementInternalID as WBSElementInternalID,
      src.WBSElementExternalID as WBSElementExternalID,
      src.WBSElementDescription as WBSElementDescription,
      src.ProjectInternalID as ProjectInternalID,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea,
      src.ObjectNumber as ObjectNumber
}
