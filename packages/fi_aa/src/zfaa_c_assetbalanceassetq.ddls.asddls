// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Asset balance report at a key date: net book value, acquisitions and depreciation to date per
//   company code and asset class, with cost center, plant and the individual asset as drill-downs.
// Example: Year-end asset balance per asset class (enter the key date, e.g. the last day of the fiscal year).
// LINK VIEW (ships only when the modules of its provider cube are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZFAA_I_AssetBalanceWithAsset applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Asset Balance by Asset Class'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFAA_C_AssetBalanceAssetQ
  provider contract analytical_query
  with parameters
    P_KeyDate : abap.dats
  as projection on ZFAA_I_AssetBalanceWithAsset( P_KeyDate: $parameters.P_KeyDate )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  AssetClass,
  @AnalyticsDetails.query.axis: #FREE
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: false, mandatory: false }
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  AssetDepreciationArea,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  FixedAssetIsActive,
  @AnalyticsDetails.query.axis: #FREE
  MasterFixedAsset,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AcquisitionsToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  DepreciationToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetBookValue
}
