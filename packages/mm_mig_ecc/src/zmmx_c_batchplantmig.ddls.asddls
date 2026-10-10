// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BatchPlantMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BatchPlantMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_BatchPlantMig
  as select from ZMMX_I_BatchPlant as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.Batch as Batch,
      src.ManufactureDate as ManufactureDate,
      src.ExpirationDate as ExpirationDate
}
