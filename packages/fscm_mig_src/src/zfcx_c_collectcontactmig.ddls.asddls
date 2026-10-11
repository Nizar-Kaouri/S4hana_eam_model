// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Contact attributes only; associated items and resubmissions remain pending.
// Purpose: Read CollectContactMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V007C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectContactMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_CollectContactMig
  as select from ZFCX_I_CollectContact as src
{
  key src.ContactUUID as ContactUUID,
      src.ContactDate as ContactDate,
      src.ContactResult as ContactResult,
      src.ContactType as ContactType,
      src.ContactDirection as ContactDirection,
      src.Reached as Reached,
      src.CollectionSegment as CollectionSegment,
      src.CollectionSpecialist as CollectionSpecialist,
      src.BusinessPartner as BusinessPartner,
      src.ContactName as ContactName,
      src.ChangedAt as ChangedAt
}
