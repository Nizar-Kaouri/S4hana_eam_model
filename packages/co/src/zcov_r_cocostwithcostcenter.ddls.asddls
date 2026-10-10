// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: CO actual cost cube enriched with cost center master data (category, person responsible, functional
//   area, texts via the dimension).
// Example: Costs per cost center category and person responsible.
// LINK VIEW (ships only when modules "cost_actuals" AND "cost_center" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'CO Actual Cost with Cost Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZCOV_R_COCostWithCostCenter
  as select from ZCOV_R_COActualCost
  association [0..1] to ZCOV_I_CostCenter as _CostCenter on $projection.ControllingArea = _CostCenter.ControllingArea
    and $projection.CostCenter = _CostCenter.CostCenter
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      ControllingArea,
      @ObjectModel.foreignKey.association: '_CostCenter'
      CostCenter,
      OrderID,
      ProfitCenter,
      GLAccount,
      GLAccountType,
      FiscalPeriod,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      PrimaryCostAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      SecondaryCostAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      TotalCostAmount,

      /* Attributes via associations (path expressions) */
      _CostCenter.CostCenterCategory,
      _CostCenter.CostCtrResponsiblePersonName,
      _CostCenter.FunctionalArea as CostCenterFunctionalArea,

      /* Associations */
      _CostCenter
}
