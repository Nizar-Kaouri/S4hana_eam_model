// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Uncleared items of supplier (K) and customer (D) accounts: account, special G/L indicator, document
//   type, posting / document / net due date, debit-credit indicator and amount.
// Example: Overdue receivables per customer; payables due next week.
// TODO-VERIFY[M] FI-040: I_OperationalAcctgDocItem is released with keys CompanyCode, FiscalYear, AccountingDocument, AccountingDocumentItem
// TODO-VERIFY[M] FI-041: elements FinancialAccountType ('K' / 'D'), ClearingAccountingDocument, NetDueDate, SpecialGLCode, AmountInCompanyCodeCurrency
// TODO-VERIFY[M] FI-042: open item = no clearing document; open items at a past key date are not supported in this version
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Open Supplier / Customer Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'AccountingDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZFIV_B_OpenItem
  as select from I_OperationalAcctgDocItem
{
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key AccountingDocumentItem,
      FinancialAccountType,
      Supplier,
      Customer,
      GLAccount,
      SpecialGLCode,
      AccountingDocumentType,
      PostingDate,
      DocumentDate,
      NetDueDate,
      DebitCreditCode,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency
}
where
  ClearingAccountingDocument = ''
  and ( FinancialAccountType = 'K' or FinancialAccountType = 'D' )
