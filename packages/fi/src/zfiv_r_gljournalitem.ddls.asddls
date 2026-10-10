// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: G/L cube: debit, credit and balance per company code, ledger, G/L account, period, profit center and
//   segment.
// Example: Trial balance per company code and period; segment P&L.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'G/L Journal Item - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFIV_R_GLJournalItem
  as select from ZFIV_I_GLJournalItem
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      ChartOfAccounts,
      GLAccount,
      FiscalPeriod,
      PostingDate,
      AccountingDocumentType,
      FinancialAccountType,
      ProfitCenter,
      Segment,
      BusinessArea,
      FunctionalArea,
      CostCenter,
      Supplier,
      Customer,
      CompanyCodeCurrency,
      GlobalCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Debit'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when DebitCreditCode = 'S' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as DebitAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Credit'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when DebitCreditCode = 'H' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as CreditAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Balance'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Balance (Global Currency)'
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Line Items'
      cast( 1 as abap.int4 ) as NumberOfLineItems
}
