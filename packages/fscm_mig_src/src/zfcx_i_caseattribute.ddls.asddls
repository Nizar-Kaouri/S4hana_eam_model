// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: One wide native record per case UUID; not synthetic attribute-name/value rows. Includes general cases, not only disputes; approve case-type scope.
// Purpose: Read CaseAttribute as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CaseAttribute'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CaseAttribute
  as select from ZFCX_B_CaseAttributeData as src
{
  key src.CaseUUID as CaseUUID,
      src.CaseType as CaseType,
      src.ExternalKey as ExternalKey,
      src.ExternalReference as ExternalReference,
      src.CreatedBy as CreatedBy,
      src.CreatedAt as CreatedAt,
      src.ChangedBy as ChangedBy,
      src.ChangedAt as ChangedAt,
      src.Processor as Processor,
      src.Responsible as Responsible,
      src.Category as Category,
      src.Priority as Priority,
      src.Status as Status,
      src.ReasonCode as ReasonCode
}
