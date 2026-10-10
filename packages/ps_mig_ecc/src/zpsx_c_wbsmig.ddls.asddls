// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WBSMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_WBSMig
  as select from ZPSX_I_WBS as src
{
  key src.WBSElementInternalID as WBSElementInternalID,
      src.WBSElementExternalID as WBSElementExternalID,
      src.WBSElementDescription as WBSElementDescription,
      src.ProjectInternalID as ProjectInternalID,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea,
      src.ObjectNumber as ObjectNumber
}
