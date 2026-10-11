// ModuPorter MM migration | Release 1.0.0
// Purpose: Read ContractHeaderMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V024N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractHeaderMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_ContractHeaderMigCount
  as select from ZMMX_C_ContractHeaderMig as src
{
  key src.PurchasingContract as PurchasingContract,
      count( * ) as RecordCount
}
group by src.PurchasingContract
