// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ContractHeaderMigCount as source candidates; approve the key-date population before posting.
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
