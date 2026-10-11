// ModuPorter SD migration | Release 1.0.0
// Purpose: Read DeliveryMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V009N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_DeliveryMigCount
  as select from ZSDX_C_DeliveryMig as src
{
  key src.DeliveryDocument as DeliveryDocument,
      count( * ) as RecordCount
}
group by src.DeliveryDocument
