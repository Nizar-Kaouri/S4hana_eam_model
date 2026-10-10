// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WBSHierarchyMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V003C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSHierarchyMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_WBSHierarchyMig
  as select from ZPSX_I_WBSHierarchy as src
{
  key src.WBSElementInternalID as WBSElementInternalID,
      src.ParentWBSElementInternalID as ParentWBSElementInternalID,
      src.FirstChildInternalID as FirstChildInternalID,
      src.PreviousSiblingInternalID as PreviousSiblingInternalID,
      src.NextSiblingInternalID as NextSiblingInternalID
}
