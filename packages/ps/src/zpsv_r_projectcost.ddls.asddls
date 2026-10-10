// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Project cost cube: actual cost before settlement, settlement and remaining balance per WBS element,
//   project, cost element and period.
// Example: Actual cost per project and fiscal period; WBS elements with costs not yet settled.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Project Cost - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPSV_R_ProjectCost
  as select from ZPSV_I_ProjectJournalItem
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      WBSElementInternalID,
      ProjectInternalID,
      FiscalPeriod,
      PostingDate,
      GLAccount,
      ControllingArea,
      BusinessTransactionType,
      IsSettlementPosting,
      ProfitCenter,
      CompanyCodeCurrency,
      GlobalCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Actual Cost (before Settlement)'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when IsSettlementPosting = '' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as ActualCostAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Settlement'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when IsSettlementPosting = 'X' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as SettlementAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Balance (after Settlement)'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency
}
