// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: CO actual cost cube enriched with profit center master data (segment, person responsible, texts via
//   the dimension).
// Example: Costs per profit center segment.
// LINK VIEW (ships only when modules "cost_actuals" AND "profit_center" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'CO Actual Cost with Profit Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZCOV_R_COCostWithProfitCtr
  as select from ZCOV_R_COActualCost
  association [0..1] to ZCOV_I_ProfitCenter as _ProfitCenter on $projection.ControllingArea = _ProfitCenter.ControllingArea
    and $projection.ProfitCenter = _ProfitCenter.ProfitCenter
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      ControllingArea,
      @ObjectModel.foreignKey.association: '_ProfitCenter'
      ProfitCenter,
      CostCenter,
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
      _ProfitCenter.Segment as ProfitCenterSegment,
      _ProfitCenter.ProfitCtrResponsiblePersonName,

      /* Associations */
      _ProfitCenter
}
