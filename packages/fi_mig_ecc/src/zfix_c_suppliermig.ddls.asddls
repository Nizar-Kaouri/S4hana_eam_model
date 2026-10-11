// ModuPorter FI migration | Release 1.0.0
// Purpose: Read SupplierMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V004C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierMig
  as select from ZFIX_I_Supplier as src
{
  key src.Supplier as Supplier,
      src.SupplierName as SupplierName,
      src.Country as Country,
      src.Region as Region,
      src.AccountGroup as AccountGroup,
      src.DeletionFlag as DeletionFlag
}
