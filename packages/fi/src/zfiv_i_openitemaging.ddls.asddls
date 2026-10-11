// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Aging cube for open payables and receivables: open and overdue amount, number of items, maximum days
//   overdue and aging bucket per company code, account type, supplier and customer.
// Example: Receivables aging per customer (buckets 1-30, 31-60, 61-90, >90 days).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Open Item Aging - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFIV_I_OpenItemAging
  as select from ZFIV_B_OpenItem
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
      NetDueDate,
      CompanyCodeCurrency,
      @EndUserText.label: 'Aging Bucket'
      cast( case when NetDueDate >= $session.system_date then '0: not due'
                 when dats_days_between( NetDueDate, $session.system_date ) <= 30 then '1: 1-30'
                 when dats_days_between( NetDueDate, $session.system_date ) <= 60 then '2: 31-60'
                 when dats_days_between( NetDueDate, $session.system_date ) <= 90 then '3: 61-90'
                 else '4: >90' end as abap.char( 12 ) ) as AgingBucket,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Amount'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Overdue Amount'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when NetDueDate < $session.system_date then cast( AmountInCompanyCodeCurrency as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as OverdueAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Items'
      cast( 1 as abap.int4 ) as NumberOfOpenItems,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Days Overdue (max)'
      case when NetDueDate < $session.system_date then dats_days_between( NetDueDate, $session.system_date ) else 0 end as DaysOverdue
}
