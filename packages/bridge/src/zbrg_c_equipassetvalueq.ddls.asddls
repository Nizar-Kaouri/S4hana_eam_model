// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_I_EquipmentAssetValue: asset values per planning plant and equipment
//   category at a key date.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "eam:equipment" AND "fi_aa:rpt_asset_balance" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_I_EquipmentAssetValue applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Equipment Asset Value'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_EquipAssetValueQ
  provider contract analytical_query
  with parameters
    P_KeyDate : abap.dats
  as projection on ZBRG_I_EquipmentAssetValue( P_KeyDate: $parameters.P_KeyDate )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  EquipmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  AssetDepreciationArea,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AcquisitionsToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  DepreciationToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NetBookValue
}
