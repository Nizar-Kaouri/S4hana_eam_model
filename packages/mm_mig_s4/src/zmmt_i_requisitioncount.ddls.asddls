// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RequisitionCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RequisitionCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZMMT_I_RequisitionCount
  as select from ZMMT_I_RequisitionCompare as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
      count( * ) as RecordCount
}
group by src.PurchaseRequisition
