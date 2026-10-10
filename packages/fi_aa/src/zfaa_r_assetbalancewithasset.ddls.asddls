// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Net book value at a key date (parameter) enriched with fixed asset master data: asset class,
//   cost center, plant, active flag and capitalization date via the asset dimension.
// Example: Net book value per asset class and cost center at fiscal year end - the classic asset balance report.
// LINK VIEW (ships only when modules "rpt_asset_balance" AND "fixed_asset" are selected).
// TODO-VERIFY[M] LNK-101: association and path expressions on a parameterized aggregating view entity (ZFAA_R_AssetBalance) as data source
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Asset Net Book Value with Asset Master'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFAA_R_AssetBalanceWithAsset
  with parameters
    P_KeyDate : abap.dats
  as select from ZFAA_R_AssetBalance( P_KeyDate: $parameters.P_KeyDate )
  association [0..1] to ZFAA_I_FixedAsset as _FixedAsset on  $projection.CompanyCode      = _FixedAsset.CompanyCode
                                                         and $projection.MasterFixedAsset = _FixedAsset.MasterFixedAsset
                                                         and $projection.FixedAsset       = _FixedAsset.FixedAsset
{
  key CompanyCode,
  key MasterFixedAsset,
      @ObjectModel.foreignKey.association: '_FixedAsset'
  key FixedAsset,
  key Ledger,
  key AssetDepreciationArea,
  key CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      NetBookValue,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AcquisitionsToDate,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      DepreciationToDate,

      /* Asset master attributes (path expressions) */
      _FixedAsset.AssetClass,
      _FixedAsset.FixedAssetIsActive,
      _FixedAsset.CostCenter,
      _FixedAsset.Plant,
      _FixedAsset.ProfitCenter,
      _FixedAsset.Segment,
      _FixedAsset.BusinessArea,
      _FixedAsset.AssetCapitalizationDate,

      /* Associations */
      _FixedAsset
}
