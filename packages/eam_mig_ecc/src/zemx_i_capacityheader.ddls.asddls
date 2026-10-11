// ModuPorter EAM migration | Release 1.0.0
// Purpose: CapacityHeader migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N53I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CapacityHeader migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_CapacityHeader
  as select from ZEMX_I_CapacityHeaderData as b
{
      @EndUserText.label: 'Capacity Internal I D'
  key b.CapacityInternalID as CapacityInternalID,
      @EndUserText.label: 'Capacity Category'
      b.CapacityCategory as CapacityCategory,
      @EndUserText.label: 'Capacity Name'
      b.CapacityName as CapacityName
}
