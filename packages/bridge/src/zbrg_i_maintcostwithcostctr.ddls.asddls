// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order actual costs enriched with the master data of the order's responsible cost center
//   (category, person responsible, texts via the dimension).
// Example: Maintenance cost per cost center category and person responsible.
// LINK VIEW (ships only when modules "co:cost_center" AND "eam:rpt_order_cost" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Cost with Cost Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_I_MaintCostWithCostCtr
  as select from ZEAM_I_MaintOrderCost
  association [0..1] to ZCOV_B_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea
    and $projection.CostCenter = _CostCenter.CostCenter
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      MaintenanceOrder,
      MaintenanceOrderType,
      MaintenanceActivityType,
      MaintenancePlanningPlant,
      ControllingArea,
      @ObjectModel.foreignKey.association: '_CostCenter'
      CostCenter,
      FiscalPeriod,
      GLAccount,
      CompanyCodeCurrency,
      GlobalCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,

      /* Attributes via associations (path expressions) */
      _CostCenter.CostCenterCategory,
      _CostCenter.CostCtrResponsiblePersonName,

      /* Associations */
      _CostCenter
}
