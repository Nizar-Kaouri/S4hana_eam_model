// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CaseAttachmentCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CaseAttachmentCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_CaseAttachmentCompare
  as select from zfct_fct014 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as CaseID,
  key src.f005 as AttachmentID,
      src.f006 as DocumentType,
      src.f007 as FileName,
      src.f008 as ContentHash,
      src.f009 as RepositoryReference
}
