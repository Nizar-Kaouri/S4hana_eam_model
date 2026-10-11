// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Revenue cube enriched with the customer master of the FI product (country, account group, name via
//   the dimension).
// Example: Revenue per customer country and account group.
// LINK VIEW (ships only when modules "fi:customer" AND "sd:billing_document" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Revenue with Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_I_RevenueWithCustomer
  as select from ZSDV_I_Revenue
  association [0..1] to ZFIV_B_Customer as _Customer on $projection.SoldToParty = _Customer.Customer
{
  key BillingDocument,
  key BillingDocumentItem,
      @ObjectModel.foreignKey.association: '_Customer'
      SoldToParty,
      SalesOrganization,
      DistributionChannel,
      MaterialGroup,
      BillingDocumentDate,
      TransactionCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      RevenueAmount,
      @Aggregation.default: #SUM
      NumberOfBillingItems,

      /* Attributes via associations (path expressions) */
      _Customer.Country as CustomerCountry,
      _Customer.CustomerAccountGroup,

      /* Associations */
      _Customer
}
