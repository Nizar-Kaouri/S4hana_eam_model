// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Supplier quality cube: goods-receipt lots with usage decision per supplier, material and month, split
//   into accepted and rejected lots and rejected quantity.
// Example: Supplier ranking by rejection rate for the last 12 months.
// TODO-VERIFY[M] QM-R01: inspection lot origin '01' = goods receipt from purchasing
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Supplier Quality'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZQMV_R_SupplierQuality
  as select from ZQMV_I_InspectionLot
  association [1..1] to ZQMV_I_InspectionLot as _InspectionLot on $projection.InspectionLot = _InspectionLot.InspectionLot
{
      @ObjectModel.foreignKey.association: '_InspectionLot'
  key InspectionLot,
      Supplier,
      Material,
      Plant,
      InspectionLotType,
      InspLotUsageDecisionDate,
      InspectionLotQuantityUnit,
      @EndUserText.label: 'Usage Decision Year/Month'
      cast( substring( InspLotUsageDecisionDate, 1, 6 ) as abap.numc( 6 ) ) as DecisionYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Decided Lots'
      cast( 1 as abap.int4 ) as NumberOfDecidedLots,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Accepted Lots'
      cast( case when InspLotUsageDecisionValuation = 'A' then 1 else 0 end as abap.int4 ) as NumberOfAcceptedLots,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Rejected Lots'
      cast( case when InspLotIsRejected = 'X' then 1 else 0 end as abap.int4 ) as NumberOfRejectedLots,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Rejected Quantity'
      @Semantics.quantity.unitOfMeasure: 'InspectionLotQuantityUnit'
      cast( case when InspLotIsRejected = 'X' then cast( InspectionLotQuantity as abap.dec( 13, 3 ) ) else 0 end
            as abap.quan( 13, 3 ) ) as RejectedQuantity,

      /* Associations */
      _InspectionLot
}
where
  InspectionLotOrigin = '01' and InspLotHasUsageDecision = 'X' and Supplier <> ''
