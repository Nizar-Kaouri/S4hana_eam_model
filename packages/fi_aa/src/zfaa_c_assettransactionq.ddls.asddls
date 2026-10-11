// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZFAA_I_AssetTransaction. Acquisitions, retirements, transfers and depreciation per company code and period.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZFAA_I_AssetTransaction applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Asset Transaction Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZFAA_C_AssetTransactionQ
  provider contract analytical_query
  as projection on ZFAA_I_AssetTransaction
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  AssetDepreciationArea,
  @AnalyticsDetails.query.axis: #FREE
  AssetValueCategory,
  @AnalyticsDetails.query.axis: #FREE
  AssetTransactionType,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  Segment,
  @AnalyticsDetails.query.axis: #FREE
  BusinessArea,
  @AnalyticsDetails.query.axis: #FREE
  MasterFixedAsset,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AcquisitionAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  RetirementAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  TransferAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  DepreciationAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  AmountInCompanyCodeCurrency
}
