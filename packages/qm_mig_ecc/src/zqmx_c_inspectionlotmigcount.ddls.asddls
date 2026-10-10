// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectionLotMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V001N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectionLotMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_InspectionLotMigCount
  as select from ZQMX_C_InspectionLotMig as src
{
  key src.InspectionLot as InspectionLot,
      count( * ) as RecordCount
}
group by src.InspectionLot
