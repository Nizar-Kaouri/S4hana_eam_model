// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Consumption cube: issued and reversed quantities and issue value for consumption movement types, per
//   material, plant, cost center, order and month.
// Example: Spare-part consumption per plant and month; top consumed materials by maintenance orders.
// TODO-VERIFY[M] MM-R03: consumption movement types 201/202 (cost center), 221/222 (project), 261/262 (order), 281/282 (network); customer-specific types are not included
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Material Consumption'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_I_MaterialConsumption
  as select from ZMMV_B_GoodsMovement
{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
      Material,
      Plant,
      StorageLocation,
      GoodsMovementType,
      PostingDate,
      CompanyCode,
      CostCenter,
      OrderID,
      MaterialBaseUnit,
      CompanyCodeCurrency,
      @EndUserText.label: 'Posting Year/Month'
      cast( substring( PostingDate, 1, 6 ) as abap.numc( 6 ) ) as PostingYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Net Consumption Quantity'
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      cast( case when DebitCreditCode = 'H' then cast( QuantityInBaseUnit as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as ConsumptionQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Reversed Consumption Quantity'
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      cast( case when DebitCreditCode = 'S' then cast( QuantityInBaseUnit as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as ConsumptionReversalQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Consumption Value'
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      cast( case when DebitCreditCode = 'H' then cast( TotalGoodsMvtAmtInCCCrcy as abap.dec( 23, 2 ) ) else 0 end
            as abap.curr( 23, 2 ) ) as ConsumptionAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Movements'
      cast( 1 as abap.int4 ) as NumberOfMovements
}
where
  GoodsMovementType = '201' or GoodsMovementType = '202' or GoodsMovementType = '221' or GoodsMovementType = '222'
  or GoodsMovementType = '261' or GoodsMovementType = '262' or GoodsMovementType = '281' or GoodsMovementType = '282'
