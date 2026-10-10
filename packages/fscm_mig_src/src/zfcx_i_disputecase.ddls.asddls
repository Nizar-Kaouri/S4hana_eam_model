// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DisputeCase as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V011R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DisputeCase'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_DisputeCase
  as select from ZFCX_I_DisputeCaseData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.CaseID as CaseID,
      src.NativeGUID as NativeGUID,
      src.BusinessPartner as BusinessPartner,
      src.CaseType as CaseType,
      src.Reason as Reason,
      src.CaseStatus as CaseStatus,
      src.Priority as Priority,
      src.DisputedAmount as DisputedAmount,
      src.Currency as Currency,
      src.CreatedAtUTC as CreatedAtUTC
}
