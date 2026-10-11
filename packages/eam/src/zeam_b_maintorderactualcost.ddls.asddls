// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Actual cost line items posted on orders (Universal Journal, leading ledger), without
//   order settlement credits; one row per journal entry item.
// Example: Actual maintenance costs per order, cost element (G/L account) and period.
// Only rows whose order is a maintenance order are kept by the join in ZEAM_I_MaintOrderCost.
// TODO-VERIFY[M] RPT-C01: I_JournalEntryItem key elements SourceLedger, CompanyCode, FiscalYear, AccountingDocument, LedgerGLLineItem, Ledger
// TODO-VERIFY[M] RPT-C02: leading ledger hard-coded as '0L' - customers with another leading ledger must change the filter
// TODO-VERIFY[M] RPT-C03: elements OrderID, BusinessTransactionType, GLAccount, FiscalPeriod, PostingDate, ControllingArea, ProfitCenter, BusinessArea
// TODO-VERIFY[M] RPT-C04: settlement credits identified by BusinessTransactionType 'KOAO' (other settlement types may exist)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order Actual Cost Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'LedgerGLLineItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintOrderActualCost
  as select from I_JournalEntryItem
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      OrderID,
      FiscalPeriod,
      PostingDate,
      GLAccount,
      BusinessTransactionType,
      ControllingArea,
      ProfitCenter,
      BusinessArea,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,
      GlobalCurrency
}
where
      Ledger                  =  '0L'
  and OrderID                 <> ''
  and BusinessTransactionType <> 'KOAO'
