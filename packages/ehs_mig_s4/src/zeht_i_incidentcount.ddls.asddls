// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read IncidentCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZEHT_I_IncidentCount
  as select from ZEHT_B_IncidentCompare as src
{
      count( * ) as RecordCount
}
