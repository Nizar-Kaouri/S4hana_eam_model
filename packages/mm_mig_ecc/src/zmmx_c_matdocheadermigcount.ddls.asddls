// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MatDocHeaderMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V013N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MatDocHeaderMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MatDocHeaderMigCount
  as select from ZMMX_C_MatDocHeaderMig as src
{
  key src.MaterialDocument as MaterialDocument,
      count( * ) as RecordCount
}
group by src.MaterialDocument
