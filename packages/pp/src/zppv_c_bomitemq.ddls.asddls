// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPPV_R_BOMItem: BOM items per category and component.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZPPV_R_BOMItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Bill of Material Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPPV_C_BOMItemQ
  provider contract analytical_query
  as projection on ZPPV_R_BOMItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  BillOfMaterialCategory,
  @AnalyticsDetails.query.axis: #ROWS
  BillOfMaterialComponent,
  @AnalyticsDetails.query.axis: #FREE
  BillOfMaterial,
  @AnalyticsDetails.query.axis: #FREE
  BillOfMaterialVariant,
  @AnalyticsDetails.query.axis: #FREE
  BillOfMaterialItemCategory,
  @AnalyticsDetails.query.axis: #FREE
  BillOfMaterialItemUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfBOMItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  BillOfMaterialItemQuantity
}
