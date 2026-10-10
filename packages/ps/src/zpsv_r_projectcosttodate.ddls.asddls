// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Project cost to date at a key date (parameter): cumulative actual cost, settled amount and balance
//   per WBS element and ledger.
// Example: Cost to date per WBS element at month end; WBS elements with unsettled balance.
// TODO-VERIFY[M] PS-R01: max( ProjectInternalID ) as a non-grouped attribute (one project per WBS element) in an aggregating view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Project Cost to Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPSV_R_ProjectCostToDate
  with parameters
    P_KeyDate : abap.dats
  as select from ZPSV_I_ProjectJournalItem
{
  key CompanyCode,
  key WBSElementInternalID,
  key Ledger,
  key CompanyCodeCurrency,
      max( ProjectInternalID ) as ProjectInternalID,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Actual Cost to Date'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( sum( case when IsSettlementPosting = '' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end )
            as abap.curr( 23, 2 ) ) as ActualCostToDate,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Settled to Date'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( sum( case when IsSettlementPosting = 'X' then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end )
            as abap.curr( 23, 2 ) ) as SettledToDate,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Balance to Date'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( sum( cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) ) as abap.curr( 23, 2 ) ) as BalanceToDate
}
where
  PostingDate <= $parameters.P_KeyDate
group by
  CompanyCode,
  WBSElementInternalID,
  Ledger,
  CompanyCodeCurrency
