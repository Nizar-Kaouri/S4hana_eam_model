// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open receivables aging enriched with customer master data (country, account group, name via the
//   dimension).
// Example: Receivables aging per country and customer.
// LINK VIEW (ships only when modules "open_items" AND "customer" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Open Items with Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFIV_I_OpenItemWithCustomer
  as select from ZFIV_I_OpenItemAging
  association [0..1] to ZFIV_B_Customer as _Customer on $projection.Customer = _Customer.Customer
{
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key AccountingDocumentItem,
      FinancialAccountType,
      @ObjectModel.foreignKey.association: '_Customer'
      Customer,
      AgingBucket,
      NetDueDate,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      OverdueAmount,
      @Aggregation.default: #SUM
      NumberOfOpenItems,
      @Aggregation.default: #MAX
      DaysOverdue,

      /* Attributes via associations (path expressions) */
      _Customer.Country,
      _Customer.CustomerAccountGroup,

      /* Associations */
      _Customer
}
where
  FinancialAccountType = 'D'
