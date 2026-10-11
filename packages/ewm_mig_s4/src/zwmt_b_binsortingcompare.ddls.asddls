// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation.
// Purpose: Read BinSortingCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-002: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BinSortingCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_B_BinSortingCompare
  as select from /scwm/lagps as src
{
  key src.lgnum as Warehouse,
  key src.lgpla as StorageBin,
  key src.aarea as ActivityArea,
  key src.act_type as Activity,
      src.lgtyp as StorageType,
      src.reihf as SortSequence
}
