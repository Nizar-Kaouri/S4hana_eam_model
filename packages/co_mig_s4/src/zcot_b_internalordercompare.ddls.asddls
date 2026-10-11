// ModuPorter CO migration | Release 1.0.0
// Purpose: Read InternalOrderCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InternalOrderCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZCOT_B_InternalOrderCompare
  as select from I_InternalOrder as src
{
  key src.InternalOrder as InternalOrder,
      src.OrderType as InternalOrderType,
      src.InternalOrderDescription as InternalOrderDescription,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea,
      src.ResponsibleCostCenter as ResponsibleCostCenter,
      src.ProfitCenter as ProfitCenter
}
