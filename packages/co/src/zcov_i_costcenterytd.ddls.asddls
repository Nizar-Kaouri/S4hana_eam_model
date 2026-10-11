// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cost center year-to-date cube (parameters fiscal year, prior fiscal year, to period): costs of the
//   current and prior year for the same periods per cost center and cost element.
// Example: Cost center report YTD vs. prior year for period 9.
// TODO-VERIFY[M] CO-R01: prior fiscal year passed as a separate parameter (no arithmetic on NUMC parameters)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Cost Center Costs Year to Date'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZCOV_I_CostCenterYTD
  with parameters
    P_FiscalYear : abap.numc( 4 ),
    P_PriorFiscalYear : abap.numc( 4 ),
    P_ToFiscalPeriod : abap.numc( 3 )
  as select from ZCOV_B_COJournalItem
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      ControllingArea,
      CostCenter,
      GLAccount,
      GLAccountType,
      FiscalPeriod,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Costs Current Year (YTD)'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when FiscalYear = $parameters.P_FiscalYear then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as CurrentYearCost,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Costs Prior Year (same periods)'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when FiscalYear = $parameters.P_PriorFiscalYear then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as PriorYearCost
}
where
  CostCenter <> ''
  and ( GLAccountType = 'P' or GLAccountType = 'S' )
  and ( FiscalYear = $parameters.P_FiscalYear or FiscalYear = $parameters.P_PriorFiscalYear )
  and FiscalPeriod <= $parameters.P_ToFiscalPeriod
