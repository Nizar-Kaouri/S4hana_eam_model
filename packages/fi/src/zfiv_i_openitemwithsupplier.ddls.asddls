// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open payables aging enriched with supplier master data (country, account group, name via the
//   dimension).
// Example: Payables aging per country and supplier.
// LINK VIEW (ships only when modules "open_items" AND "supplier" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Open Items with Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZFIV_I_OpenItemWithSupplier
  as select from ZFIV_I_OpenItemAging
  association [0..1] to ZFIV_B_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
{
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key AccountingDocumentItem,
      FinancialAccountType,
      @ObjectModel.foreignKey.association: '_Supplier'
      Supplier,
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
      _Supplier.Country,
      _Supplier.SupplierAccountGroup,

      /* Associations */
      _Supplier
}
where
  FinancialAccountType = 'K'
