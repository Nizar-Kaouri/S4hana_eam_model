// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WBSHierarchyData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSHierarchyData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_WBSHierarchyData
  as select from prhi as src
{
  key src.posnr as WBSElementInternalID,
      src.up as ParentWBSElementInternalID,
      src.down as FirstChildInternalID,
      src.left as PreviousSiblingInternalID,
      src.right as NextSiblingInternalID
}
