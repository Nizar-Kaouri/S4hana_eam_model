// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CollectContact as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectContact'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CollectContact
  as select from ZFCX_I_CollectContactData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
  key src.CollectionSegment as CollectionSegment,
  key src.ContactID as ContactID,
      src.ContactAtUTC as ContactAtUTC,
      src.ContactType as ContactType,
      src.ContactResult as ContactResult,
      src.Specialist as Specialist
}
