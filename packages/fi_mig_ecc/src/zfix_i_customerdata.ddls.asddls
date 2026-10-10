// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CustomerData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FIX-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_CustomerData
  as select from kna1 as src
{
  key src.kunnr as Customer,
      src.name1 as CustomerName,
      src.land1 as Country,
      src.regio as Region,
      src.ktokd as AccountGroup,
      src.loevm as DeletionFlag
}
