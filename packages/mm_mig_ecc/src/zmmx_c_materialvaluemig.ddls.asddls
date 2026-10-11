// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MaterialValueMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V006C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialValueMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MaterialValueMig
  as select from ZMMX_I_MaterialValue as src
{
  key src.Product as Product,
  key src.ValuationArea as ValuationArea,
  key src.ValuationType as ValuationType,
      src.ValuationClass as ValuationClass,
      src.PriceControl as PriceControl,
      src.StandardPrice as StandardPrice,
      src.MovingAveragePrice as MovingAveragePrice,
      src.PriceUnit as PriceUnit
}
