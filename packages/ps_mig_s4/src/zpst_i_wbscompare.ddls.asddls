// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WBSCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PST-002: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZPST_I_WBSCompare
  as select from I_WBSElement as src
{
  key src.WBSElementInternalID as WBSElementInternalID,
      src.WBSElement as WBSElementExternalID,
      src.WBSDescription as WBSElementDescription
}
