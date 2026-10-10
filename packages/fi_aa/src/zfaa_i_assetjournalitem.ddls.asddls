// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Universal Journal line items that carry a fixed asset, with ledger, depreciation area, asset
//   transaction type, G/L account and account type, amounts in company code and global currency, and a
//   derived value category (acquisition, retirement, transfer, depreciation, other).
// Example: Acquisitions and depreciation per asset class and period; basis for the net book value report.
// Value category rule: depreciation run postings by business transaction type, otherwise the first digit
// of the asset transaction type (1xx acquisition, 2xx retirement, 3xx transfer - SAP standard ranges).
// TODO-VERIFY[M] AT-001: I_JournalEntryItem key elements SourceLedger, CompanyCode, FiscalYear, AccountingDocument, LedgerGLLineItem, Ledger
// TODO-VERIFY[M] AT-002: asset elements MasterFixedAsset, FixedAsset, AssetTransactionType, AssetDepreciationArea, AssetValueDate in I_JournalEntryItem
// TODO-VERIFY[H] AT-003: depreciation run postings identified by BusinessTransactionType 'AFAB'
// TODO-VERIFY[M] AT-004: asset transaction type ranges 1xx/2xx/3xx hold for the customer's configuration (customer-defined types may differ)
// TODO-VERIFY[M] AT-005: I_GLAccountInChartOfAccounts with element GLAccountType ('X' = balance sheet account)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Fixed Asset Journal Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'LedgerGLLineItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZFAA_I_AssetJournalItem
  as select from I_JournalEntryItem
  association [0..1] to I_GLAccountInChartOfAccounts as _GLAccountInChartOfAccounts
    on  $projection.ChartOfAccounts = _GLAccountInChartOfAccounts.ChartOfAccounts
    and $projection.GLAccount       = _GLAccountInChartOfAccounts.GLAccount
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      MasterFixedAsset,
      FixedAsset,
      AssetDepreciationArea,
      AssetTransactionType,
      BusinessTransactionType,
      @EndUserText.label: 'Asset Value Category'
      cast( case when BusinessTransactionType = 'AFAB' then 'DEP'
                 when substring( AssetTransactionType, 1, 1 ) = '1' then 'ACQ'
                 when substring( AssetTransactionType, 1, 1 ) = '2' then 'RET'
                 when substring( AssetTransactionType, 1, 1 ) = '3' then 'TRF'
                 else 'OTH' end as abap.char( 3 ) ) as AssetValueCategory,
      FiscalPeriod,
      PostingDate,
      AssetValueDate,
      ChartOfAccounts,
      GLAccount,
      CostCenter,
      ProfitCenter,
      Segment,
      BusinessArea,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,
      GlobalCurrency,

      /* G/L account attributes (path expression) */
      _GLAccountInChartOfAccounts.GLAccountType as GLAccountType,

      /* Associations */
      _GLAccountInChartOfAccounts
}
where
  MasterFixedAsset <> ''
