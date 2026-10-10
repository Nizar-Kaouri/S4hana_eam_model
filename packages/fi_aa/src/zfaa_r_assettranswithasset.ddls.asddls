// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Asset transaction cube enriched with fixed asset master data: foreign key to the asset
//   dimension (navigation attributes) and asset class, capitalization year and plant as characteristics.
// Example: Acquisitions (capex) per asset class and plant; depreciation per asset class and period.
// LINK VIEW (ships only when modules "asset_transaction" AND "fixed_asset" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Asset Transaction with Asset Master'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFAA_R_AssetTransWithAsset
  as select from ZFAA_R_AssetTransaction
  association [0..1] to ZFAA_I_FixedAsset as _FixedAsset on  $projection.CompanyCode      = _FixedAsset.CompanyCode
                                                         and $projection.MasterFixedAsset = _FixedAsset.MasterFixedAsset
                                                         and $projection.FixedAsset       = _FixedAsset.FixedAsset
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      MasterFixedAsset,
      @ObjectModel.foreignKey.association: '_FixedAsset'
      FixedAsset,
      AssetDepreciationArea,
      AssetValueCategory,
      FiscalPeriod,
      GLAccount,
      GLAccountType,
      CostCenter,
      ProfitCenter,
      Segment,
      BusinessArea,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AcquisitionAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      RetirementAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      TransferAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      DepreciationAmount,

      /* Asset master attributes (path expressions) */
      _FixedAsset.AssetClass,
      _FixedAsset.FixedAssetIsActive,
      _FixedAsset.Plant,
      _FixedAsset.AssetLocation,
      _FixedAsset.AssetCapitalizationDate,

      /* Associations */
      _FixedAsset
}
