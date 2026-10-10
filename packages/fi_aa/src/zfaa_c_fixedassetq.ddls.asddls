// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFAA_R_FixedAsset. Number of (active) assets per company code and asset class.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZFAA_R_FixedAsset applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Asset Register Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFAA_C_FixedAssetQ
  provider contract analytical_query
  as projection on ZFAA_R_FixedAsset
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  AssetClass,
  @AnalyticsDetails.query.axis: #FREE
  FixedAssetIsActive,
  @AnalyticsDetails.query.axis: #FREE
  AssetCapitalizationYear,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  AssetLocation,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  Segment,
  @AnalyticsDetails.query.axis: #FREE
  BusinessArea,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfFixedAssets,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfActiveFixedAssets
}
