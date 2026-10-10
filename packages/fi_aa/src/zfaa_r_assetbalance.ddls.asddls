// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Net book value per fixed asset, ledger and depreciation area at a key date (parameter): sum of
//   all balance-sheet postings on the asset up to the key date, plus cumulative acquisitions and
//   depreciation on balance-sheet accounts.
// Example: Net book value per asset class at fiscal year end (with the link cube); assets fully depreciated.
// Module rpt_asset_balance has a hard dependency on asset_transaction.
// KNOWN LIMITATION: values come from posted journal entries only; planned depreciation (FAAT_PLAN_VALUES)
//   and unposted values are not included.
// TODO-VERIFY[H] AB-R01: net book value = balance-sheet postings carrying the asset up to the key date (definition to confirm with the customer's FI-AA setup)
// TODO-VERIFY[M] AB-R02: cast of a summed amount case expression to abap.curr in an aggregating view entity with parameters
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Asset Net Book Value at Key Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFAA_R_AssetBalance
  with parameters
    P_KeyDate : abap.dats
  as select from ZFAA_I_AssetJournalItem
{
  key CompanyCode,
  key MasterFixedAsset,
  key FixedAsset,
  key Ledger,
  key AssetDepreciationArea,
  key CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Net Book Value'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( sum( case when GLAccountType = 'X' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end )
            as abap.curr( 23, 2 ) ) as NetBookValue,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Acquisitions to Date'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( sum( case when GLAccountType = 'X' and AssetValueCategory = 'ACQ'
                      then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end )
            as abap.curr( 23, 2 ) ) as AcquisitionsToDate,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Depreciation to Date'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( sum( case when GLAccountType = 'X' and AssetValueCategory = 'DEP'
                      then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end )
            as abap.curr( 23, 2 ) ) as DepreciationToDate
}
where
  PostingDate <= $parameters.P_KeyDate
group by
  CompanyCode,
  MasterFixedAsset,
  FixedAsset,
  Ledger,
  AssetDepreciationArea,
  CompanyCodeCurrency
