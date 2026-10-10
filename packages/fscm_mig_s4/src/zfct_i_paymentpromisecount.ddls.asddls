// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PaymentPromiseCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PaymentPromiseCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFCT_I_PaymentPromiseCount
  as select from ZFCT_I_PaymentPromiseCompare as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
      count( * ) as RecordCount
}
group by src.SourceSystem, src.SourceClient, src.ExportBatch
