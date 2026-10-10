// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CreditRelation as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditRelation'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CreditRelation
  as select from ZFCX_I_CreditRelationData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
  key src.RelatedPartner as RelatedPartner,
  key src.RelationType as RelationType,
  key src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
