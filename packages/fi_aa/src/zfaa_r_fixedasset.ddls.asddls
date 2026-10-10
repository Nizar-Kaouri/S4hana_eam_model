// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Asset register cube: number of assets, active and deactivated assets, by company code, asset
//   class, capitalization year, cost center and plant.
// Example: Number of active assets per asset class and plant; assets capitalized per year.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Fixed Asset - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFAA_R_FixedAsset
  as select from ZFAA_I_FixedAsset
  association [1..1] to ZFAA_I_FixedAsset as _FixedAsset on  $projection.CompanyCode      = _FixedAsset.CompanyCode
                                                         and $projection.MasterFixedAsset = _FixedAsset.MasterFixedAsset
                                                         and $projection.FixedAsset       = _FixedAsset.FixedAsset
{
      @ObjectModel.foreignKey.association: '_CompanyCode'
  key CompanyCode,
  key MasterFixedAsset,
      @ObjectModel.foreignKey.association: '_FixedAsset'
  key FixedAsset,
      @ObjectModel.foreignKey.association: '_AssetClass'
      AssetClass,
      FixedAssetIsActive,
      AssetCapitalizationDate,
      @EndUserText.label: 'Capitalization Year'
      cast( substring( AssetCapitalizationDate, 1, 4 ) as abap.numc( 4 ) ) as AssetCapitalizationYear,
      AssetDeactivationDate,
      CostCenter,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      AssetLocation,
      ProfitCenter,
      Segment,
      BusinessArea,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Assets'
      cast( 1 as abap.int4 ) as NumberOfFixedAssets,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Active Assets'
      cast( case when FixedAssetIsActive = 'X' then 1 else 0 end as abap.int4 ) as NumberOfActiveFixedAssets,

      /* Associations */
      _CompanyCode,
      _AssetClass,
      _Plant,
      _FixedAsset
}
