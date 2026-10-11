// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Universal Journal line items with a controlling area: cost center, order, WBS element, profit center,
//   segment, functional area, G/L account (cost element) and its account type, period and amounts.
// Example: Primary costs per cost center and cost element; internal activity allocations (secondary costs).
// TODO-VERIFY[M] CO-030: G/L account types 'P' (primary costs) and 'S' (secondary costs) in GLAccountType of I_GLAccountInChartOfAccounts
// TODO-VERIFY[M] CO-031: CO account assignment elements CostCenter, OrderID, WBSElementInternalID, FunctionalArea in I_JournalEntryItem
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Controlling Journal Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Ledger'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XXL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZCOV_B_COJournalItem
  as select from I_JournalEntryItem
  association [0..1] to I_GLAccountInChartOfAccounts as _GLAccountInChartOfAccounts on $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts
    and $projection.GLAccount = _GLAccountInChartOfAccounts.GLAccount
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
      ChartOfAccounts,
      GLAccount,
      FiscalPeriod,
      PostingDate,
      BusinessTransactionType,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      GlobalCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,

      /* G/L account attributes (path expression) */
      _GLAccountInChartOfAccounts.GLAccountType as GLAccountType,

      /* Associations */
      _GLAccountInChartOfAccounts
}
where
  ControllingArea <> ''
