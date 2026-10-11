// ModuPorter EAM migration | Release 1.0.0
// Purpose: CapacityHeader source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm KAKO keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N53B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CapacityHeader source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_CapacityHeaderData
  as select from kako as t
{
      @EndUserText.label: 'Capacity Internal I D'
  key t.kapid as CapacityInternalID,
      @EndUserText.label: 'Capacity Category'
      t.kapar as CapacityCategory,
      @EndUserText.label: 'Capacity Name'
      t.name as CapacityName
}
