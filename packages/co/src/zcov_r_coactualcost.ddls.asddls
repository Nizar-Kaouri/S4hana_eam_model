// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: CO actual cost cube: primary, secondary and total costs per cost center, order, WBS element, profit
//   center, cost element and period.
// Example: Cost center report per period; secondary cost allocations between cost centers.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'CO Actual Cost - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZCOV_R_COActualCost
  as select from ZCOV_I_COJournalItem
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      ControllingArea,
      CostCenter,
      OrderID,
      WBSElementInternalID,
      ProfitCenter,
      Segment,
      FunctionalArea,
      GLAccount,
      GLAccountType,
      FiscalPeriod,
      BusinessTransactionType,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Primary Costs'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when GLAccountType = 'P' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as PrimaryCostAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Secondary Costs'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when GLAccountType = 'S' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as SecondaryCostAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Total Costs'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when GLAccountType = 'P' or GLAccountType = 'S' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as TotalCostAmount
}
