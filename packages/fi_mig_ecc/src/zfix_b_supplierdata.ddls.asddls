// ModuPorter FI migration | Release 1.0.0
// Purpose: Read SupplierData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_SupplierData
  as select from lfa1 as src
{
  key src.lifnr as Supplier,
      src.name1 as SupplierName,
      src.land1 as Country,
      src.regio as Region,
      src.ktokk as AccountGroup,
      src.loevm as DeletionFlag
}
