// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: One wide native record per case UUID; not synthetic attribute-name/value rows. Includes general cases, not only disputes; approve case-type scope.
// Purpose: Read CaseAttributeData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCX-013: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFCX_V013'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CaseAttributeData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFCX_B_CaseAttributeData
  as select from scmg_t_case_attr as src
{
  key src.case_guid as CaseUUID,
      src.case_type as CaseType,
      src.ext_key as ExternalKey,
      src.ext_ref as ExternalReference,
      src.created_by as CreatedBy,
      src.create_time as CreatedAt,
      src.changed_by as ChangedBy,
      src.change_time as ChangedAt,
      src.processor as Processor,
      src.responsible as Responsible,
      src.category as Category,
      src.priority as Priority,
      src.stat_para as Status,
      src.reason_code as ReasonCode
}
