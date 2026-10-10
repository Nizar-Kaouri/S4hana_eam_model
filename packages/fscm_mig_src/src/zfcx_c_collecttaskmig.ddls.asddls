// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CollectTaskMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectTaskMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_CollectTaskMig
  as select from ZFCX_I_CollectTask as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
  key src.CollectionSegment as CollectionSegment,
  key src.TaskID as TaskID,
      src.Reason as Reason,
      src.DueAtUTC as DueAtUTC,
      src.TaskStatus as TaskStatus,
      src.RelatedContact as RelatedContact
}
