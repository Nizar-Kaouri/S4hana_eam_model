// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: CapacityHeader migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N53C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'CapacityHeader migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_CapacityHeaderMig
  as select from ZEMX_I_CapacityHeader as src
{
      @EndUserText.label: 'Capacity Internal I D'
  key src.CapacityInternalID as CapacityInternalID,
      @EndUserText.label: 'Capacity Category'
      src.CapacityCategory as CapacityCategory,
      @EndUserText.label: 'Capacity Name'
      src.CapacityName as CapacityName
}
