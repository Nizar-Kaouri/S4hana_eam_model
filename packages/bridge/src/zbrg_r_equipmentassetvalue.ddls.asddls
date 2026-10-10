// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Net book value, acquisitions and depreciation to date (key date parameter) of the fixed asset behind
//   each equipment.
// Example: Net book value of the installed base per equipment category and plant; old equipment with zero book value.
// LINK VIEW (ships only when modules "eam:equipment" AND "fi_aa:rpt_asset_balance" are selected).
// TODO-VERIFY[H] BRG-002: several equipment on one asset repeat the asset values per equipment - totals over equipment overstate the asset values
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment with Asset Net Book Value'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_R_EquipmentAssetValue
  with parameters
    P_KeyDate : abap.dats
  as select from ZEAM_I_Equipment as Equipment
    inner join ZFAA_R_AssetBalance( P_KeyDate: $parameters.P_KeyDate ) as AssetBalance
      on  AssetBalance.CompanyCode      = Equipment.CompanyCode
      and AssetBalance.MasterFixedAsset = Equipment.MasterFixedAsset
      and AssetBalance.FixedAsset       = Equipment.FixedAsset
{
  key Equipment.Equipment,
  key AssetBalance.Ledger,
  key AssetBalance.AssetDepreciationArea,
  key AssetBalance.CompanyCodeCurrency,
      Equipment.CompanyCode,
      Equipment.MasterFixedAsset,
      Equipment.FixedAsset,
      Equipment.EquipmentCategory,
      Equipment.TechnicalObjectType,
      Equipment.AuthorizationGroup,
      Equipment.MaintenancePlant,
      Equipment.MaintenancePlanningPlant,
      Equipment.PlantSection,
      Equipment.BusinessArea,
      Equipment.CostCenter,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AssetBalance.NetBookValue,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AssetBalance.AcquisitionsToDate,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AssetBalance.DepreciationToDate
}
