// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PhraseCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PhraseCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZEHT_I_PhraseCount
  as select from ZEHT_I_PhraseCompare as src
{
      count( * ) as RecordCount
}
