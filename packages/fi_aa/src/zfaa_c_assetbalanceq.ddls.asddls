// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Net book value query at a key date (parameter) per company code, ledger and depreciation area.
// Example: Asset balance at fiscal year end per company code; drill down to the individual asset.
// DESIGN NOTE: no DCL (transient query); the DCL of ZFAA_R_AssetBalance applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Asset Net Book Value Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFAA_C_AssetBalanceQ
  provider contract analytical_query
  with parameters
    P_KeyDate : abap.dats
  as projection on ZFAA_R_AssetBalance( P_KeyDate: $parameters.P_KeyDate )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  AssetDepreciationArea,
  @AnalyticsDetails.query.axis: #FREE
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: false, mandatory: false }
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  MasterFixedAsset,
  @AnalyticsDetails.query.axis: #FREE
  FixedAsset,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AcquisitionsToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  DepreciationToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetBookValue
}
