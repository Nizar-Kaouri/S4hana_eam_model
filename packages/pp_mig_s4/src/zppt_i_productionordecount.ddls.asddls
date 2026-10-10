// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionOrdeCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOrdeCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZPPT_I_ProductionOrdeCount
  as select from ZPPT_I_ProductionOrdeCompare as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
      count( * ) as RecordCount
}
group by src.ManufacturingOrder
