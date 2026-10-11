// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Inspection lot cube: number of lots, lots with usage decision, rejected lots and lot quantity per
//   plant, origin, material, supplier and month.
// Example: Rejection rate per supplier for goods-receipt inspections; open lots per plant.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Inspection Lot - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZQMV_I_InspectionLot
  as select from ZQMV_B_InspectionLot
  association [1..1] to ZQMV_B_InspectionLot as _InspectionLot on $projection.InspectionLot = _InspectionLot.InspectionLot
{
      @ObjectModel.foreignKey.association: '_InspectionLot'
  key InspectionLot,
      InspectionLotType,
      InspectionLotOrigin,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      Supplier,
      InspectionLotQuantityUnit,
      InspLotCreatedOnLocalDate,
      InspectionLotUsageDecisionCode,
      InspLotUsageDecisionValuation,
      InspLotHasUsageDecision,
      InspLotIsRejected,
      @EndUserText.label: 'Lot Creation Year/Month'
      cast( substring( InspLotCreatedOnLocalDate, 1, 6 ) as abap.numc( 6 ) ) as InspLotCreationYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Inspection Lots'
      cast( 1 as abap.int4 ) as NumberOfInspectionLots,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Lots with Usage Decision'
      cast( case when InspLotHasUsageDecision = 'X' then 1 else 0 end as abap.int4 ) as NumberOfLotsWithDecision,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Rejected Lots'
      cast( case when InspLotIsRejected = 'X' then 1 else 0 end as abap.int4 ) as NumberOfRejectedLots,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'InspectionLotQuantityUnit'
      InspectionLotQuantity,

      /* Associations */
      _Plant,
      _InspectionLot
}
