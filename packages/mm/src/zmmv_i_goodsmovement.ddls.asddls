// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Goods movement cube: receipt and issue quantities and values per material, plant, movement type and
//   month.
// Example: Monthly issue value per plant and movement type; receipts per supplier.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Goods Movement - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_I_GoodsMovement
  as select from ZMMV_B_GoodsMovement
{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      StorageLocation,
      GoodsMovementType,
      DebitCreditCode,
      PostingDate,
      CompanyCode,
      MaterialBaseUnit,
      CompanyCodeCurrency,
      CostCenter,
      OrderID,
      Supplier,
      @EndUserText.label: 'Posting Year/Month'
      cast( substring( PostingDate, 1, 6 ) as abap.numc( 6 ) ) as PostingYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Receipt Quantity'
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      cast( case when DebitCreditCode = 'S' then cast( QuantityInBaseUnit as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as ReceiptQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Issue Quantity'
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      cast( case when DebitCreditCode = 'H' then cast( QuantityInBaseUnit as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as IssueQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Receipt Value'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when DebitCreditCode = 'S' then cast( TotalGoodsMvtAmtInCCCrcy as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as ReceiptAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Issue Value'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when DebitCreditCode = 'H' then cast( TotalGoodsMvtAmtInCCCrcy as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as IssueAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Movements'
      cast( 1 as abap.int4 ) as NumberOfMovements,

      /* Associations */
      _Plant
}
