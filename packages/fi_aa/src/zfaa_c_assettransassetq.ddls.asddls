// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFAA_I_AssetTransWithAsset. Acquisitions, retirements, transfers and depreciation per company code and asset class.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when the modules of its provider cube are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZFAA_I_AssetTransWithAsset applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Asset Transactions by Asset Class'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFAA_C_AssetTransAssetQ
  provider contract analytical_query
  as projection on ZFAA_I_AssetTransWithAsset
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  AssetClass,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  AssetDepreciationArea,
  @AnalyticsDetails.query.axis: #FREE
  AssetValueCategory,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  AssetLocation,
  @AnalyticsDetails.query.axis: #FREE
  FixedAssetIsActive,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AcquisitionAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  RetirementAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  TransferAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  DepreciationAmount
}
