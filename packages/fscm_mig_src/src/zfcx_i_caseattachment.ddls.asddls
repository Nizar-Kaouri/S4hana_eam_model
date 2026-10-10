// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CaseAttachment as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V014R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CaseAttachment'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CaseAttachment
  as select from ZFCX_I_CaseAttachmentData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.CaseID as CaseID,
  key src.AttachmentID as AttachmentID,
      src.DocumentType as DocumentType,
      src.FileName as FileName,
      src.ContentHash as ContentHash,
      src.RepositoryReference as RepositoryReference
}
