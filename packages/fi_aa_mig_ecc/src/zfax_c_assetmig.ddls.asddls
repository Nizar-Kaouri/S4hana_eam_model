// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFAX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFAX_C_AssetMig
  as select from ZFAX_I_Asset as src
{
  key src.CompanyCode as CompanyCode,
  key src.MasterFixedAsset as MasterFixedAsset,
  key src.FixedAsset as FixedAsset,
      src.AssetClass as AssetClass,
      src.FixedAssetDescription as FixedAssetDescription,
      src.InventoryNumber as InventoryNumber,
      src.AssetCapitalizationDate as AssetCapitalizationDate,
      src.AssetDeactivationDate as AssetDeactivationDate,
      src.AssetDescription2 as AssetDescription2,
      src.SerialNumber as SerialNumber,
      src.Manufacturer as Manufacturer,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit
}
