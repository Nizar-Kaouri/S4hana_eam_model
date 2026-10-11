// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cost center cube: number of cost centers per company code, category and profit center.
// Example: Organizational overview of cost centers per company code.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Cost Center - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZCOV_I_CostCenter
  as select from ZCOV_B_CostCenter
  association [1..1] to ZCOV_B_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea
    and $projection.CostCenter = _CostCenter.CostCenter
{
  key ControllingArea,
      @ObjectModel.foreignKey.association: '_CostCenter'
  key CostCenter,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      CostCenterCategory,
      ProfitCenter,
      BusinessArea,
      FunctionalArea,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Cost Centers'
      cast( 1 as abap.int4 ) as NumberOfCostCenters,

      /* Associations */
      _CompanyCode,
      _CostCenter
}
