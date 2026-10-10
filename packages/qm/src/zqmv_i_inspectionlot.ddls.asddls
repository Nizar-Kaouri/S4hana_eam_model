// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per inspection lot: lot type and origin (goods receipt, production, ...), material, plant,
//   batch, supplier, quantities, dates and the usage decision with its valuation (accepted / rejected).
// Example: Rejected goods-receipt lots per supplier; lots without usage decision older than 14 days.
// TODO-VERIFY[M] QM-001: I_InspectionLot exists, is released (C1) with key InspectionLot
// TODO-VERIFY[H] QM-002: usage decision elements InspectionLotUsageDecisionCode, InspLotUsageDecisionValuation ('A' accepted / 'R' rejected), InspLotUsageDecisionDate
// TODO-VERIFY[M] QM-003: elements InspectionLotType, InspectionLotOrigin, Supplier, ManufacturingOrder, PurchasingDocument
// TODO-VERIFY[M] QM-004: quantity and date elements InspectionLotQuantity, InspectionLotActualQuantity, InspLotCreatedOnLocalDate, InspectionLotStartDate, InspectionLotEndDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Inspection Lot'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'InspectionLot'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZQMV_I_InspectionLot
  as select from I_InspectionLot
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
  key InspectionLot,
      InspectionLotType,
      InspectionLotOrigin,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      Batch,
      Supplier,
      ManufacturingOrder,
      PurchasingDocument,
      InspectionLotQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'InspectionLotQuantityUnit'
      InspectionLotQuantity,
      @Semantics.quantity.unitOfMeasure: 'InspectionLotQuantityUnit'
      InspectionLotActualQuantity,
      InspLotCreatedOnLocalDate,
      InspectionLotStartDate,
      InspectionLotEndDate,
      InspectionLotUsageDecisionCode,
      InspLotUsageDecisionValuation,
      InspLotUsageDecisionDate,
      @EndUserText.label: 'Usage Decision Made'
      cast( case when InspectionLotUsageDecisionCode <> '' then 'X' else ' ' end as abap_boolean ) as InspLotHasUsageDecision,
      @EndUserText.label: 'Lot Rejected'
      cast( case when InspLotUsageDecisionValuation = 'R' then 'X' else ' ' end as abap_boolean ) as InspLotIsRejected,

      /* Associations */
      _Plant
}
