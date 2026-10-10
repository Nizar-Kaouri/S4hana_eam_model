// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Revenue cube (cancelled documents excluded): signed net revenue, billed quantity and number of items
//   per sales area, customer, material group, profit center and billing date.
// Example: Monthly revenue per sales organization and material group; top customers by revenue.
// TODO-VERIFY[M] SD-R01: revenue sign by document category in a case expression over a path element; cancelled billing documents excluded via path in WHERE
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Revenue - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZSDV_R_Revenue
  as select from ZSDV_I_BillingDocumentItem
{
      @ObjectModel.foreignKey.association: '_BillingDocument'
  key BillingDocument,
  key BillingDocumentItem,
      Material,
      MaterialGroup,
      Plant,
      BillingQuantityUnit,
      TransactionCurrency,
      ProfitCenter,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Revenue'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      cast( case when _BillingDocument.SDDocumentCategory = 'O' or _BillingDocument.SDDocumentCategory = 'N'
            then -cast( NetAmount as abap.dec( 23, 2 ) ) else cast( NetAmount as abap.dec( 23, 2 ) ) end
            as abap.curr( 23, 2 ) ) as RevenueAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Billed Quantity'
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
      BillingQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Billing Items'
      cast( 1 as abap.int4 ) as NumberOfBillingItems,

      /* Billing header characteristics */
      _BillingDocument.BillingDocumentType,
      _BillingDocument.SDDocumentCategory,
      _BillingDocument.BillingDocumentDate,
      _BillingDocument.SoldToParty,
      _BillingDocument.PayerParty,
      _BillingDocument.SalesOrganization,
      _BillingDocument.DistributionChannel,
      _BillingDocument.Division,
      _BillingDocument.CompanyCode,

      /* Associations */
      _BillingDocument
}
where
  _BillingDocument.BillingDocumentIsCancelled = ''
