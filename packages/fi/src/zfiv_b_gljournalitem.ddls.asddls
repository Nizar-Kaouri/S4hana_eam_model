// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Universal Journal line items of all ledgers: G/L account, period, dates, document type, debit /
//   credit indicator, account type, profit center, segment, business and functional area, cost center, supplier,
//   customer, reversal flags and amounts in company code, global and transaction currency.
// Example: Trial balance per company code and period; postings per supplier and account.
// TODO-VERIFY[M] FI-010: elements AccountingDocumentType, DebitCreditCode, FinancialAccountType, IsReversal, IsReversed in I_JournalEntryItem
// TODO-VERIFY[M] FI-011: transaction currency elements TransactionCurrency, AmountInTransactionCurrency
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'G/L Journal Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Ledger'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XXL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZFIV_B_GLJournalItem
  as select from I_JournalEntryItem
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
      DocumentDate,
      AccountingDocumentType,
      DebitCreditCode,
      FinancialAccountType,
      ProfitCenter,
      Segment,
      BusinessArea,
      FunctionalArea,
      CostCenter,
      Supplier,
      Customer,
      IsReversal,
      IsReversed,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      GlobalCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      AmountInTransactionCurrency
}
