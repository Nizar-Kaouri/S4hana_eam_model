// ModuPorter MM migration | Release 1.0.0
// Purpose: Read RequisitionCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RequisitionCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZMMT_I_RequisitionCount
  as select from ZMMT_B_RequisitionCompare as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
      count( * ) as RecordCount
}
group by src.PurchaseRequisition
