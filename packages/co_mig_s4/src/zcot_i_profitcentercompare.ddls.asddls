// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProfitCenterCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COT-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenterCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZCOT_I_ProfitCenterCompare
  as select from I_ProfitCenter as src
{
  key src.ProfitCenter as ProfitCenter,
  key src.ValidityEndDate as ValidityEndDate,
  key src.ControllingArea as ControllingArea,
      src.ValidityStartDate as ValidityStartDate,
      src.ResponsiblePerson as ResponsiblePerson,
      src.Segment as Segment
}
