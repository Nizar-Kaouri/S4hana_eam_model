// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Asset transaction cube: journal amounts split into acquisitions, retirements, transfers and
//   depreciation, by company code, ledger, depreciation area, period and G/L account.
// Example: Depreciation posted per period and depreciation area; acquisitions per year (capex view).
// TODO-VERIFY[M] AT-R01: case expressions over an amount element cast to abap.curr with the currency reference kept
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Asset Transaction - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFAA_I_AssetTransaction
  as select from ZFAA_B_AssetJournalItem
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
      AssetValueCategory,
      FiscalPeriod,
      PostingDate,
      GLAccount,
      GLAccountType,
      CostCenter,
      ProfitCenter,
      Segment,
      BusinessArea,
      CompanyCodeCurrency,

      /* Measures (company code currency) */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Acquisitions'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when AssetValueCategory = 'ACQ' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as AcquisitionAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Retirements'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when AssetValueCategory = 'RET' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as RetirementAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Transfers'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when AssetValueCategory = 'TRF' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as TransferAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Depreciation'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when AssetValueCategory = 'DEP' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as DepreciationAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Line Items'
      cast( 1 as abap.int4 ) as NumberOfLineItems
}
