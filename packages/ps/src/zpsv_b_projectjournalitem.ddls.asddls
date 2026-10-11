// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Universal Journal line items posted on a WBS element (all ledgers), with project, G/L account (cost
//   element), period, business transaction and amounts; settlement postings flagged.
// Example: Actual cost per WBS element and cost element; settlement to assets or cost centers.
// TODO-VERIFY[M] PS-020: elements WBSElementInternalID and ProjectInternalID in I_JournalEntryItem (NUMC8 internal key, initial '00000000')
// TODO-VERIFY[M] PS-021: settlement postings identified by BusinessTransactionType 'KOAO' (same as EAM RPT-C04)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Project Journal Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Ledger'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XXL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZPSV_B_ProjectJournalItem
  as select from I_JournalEntryItem
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
      ChartOfAccounts,
      GLAccount,
      ControllingArea,
      BusinessTransactionType,
      ProfitCenter,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      GlobalCurrency,
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      AmountInGlobalCurrency,
      @EndUserText.label: 'Settlement Posting'
      cast( case when BusinessTransactionType = 'KOAO' then 'X' else ' ' end as abap_boolean ) as IsSettlementPosting
}
where
  WBSElementInternalID <> '00000000'
