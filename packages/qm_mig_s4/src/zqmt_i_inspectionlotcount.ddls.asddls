// ModuPorter QM migration | Release 1.0.0
// Purpose: Read InspectionLotCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectionLotCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZQMT_I_InspectionLotCount
  as select from ZQMT_I_InspectionLotCompare as src
{
  key src.InspectionLot as InspectionLot,
      count( * ) as RecordCount
}
group by src.InspectionLot
