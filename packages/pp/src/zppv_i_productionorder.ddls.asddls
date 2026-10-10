// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per production order: type, category, material, plant, MRP controller, supervisor, version,
//   planned / scrap / confirmed / delivered quantity, planned dates, release date and completion; derived open
//   flag.
// Example: Open production orders per plant and MRP controller; yield vs. planned quantity per material.
// TODO-VERIFY[M] PP-001: I_ManufacturingOrder exists, is released (C1) with key ManufacturingOrder
// TODO-VERIFY[H] PP-002: quantity elements MfgOrderPlannedTotalQty, MfgOrderPlannedScrapQty, MfgOrderConfirmedYieldQty, ActualDeliveredQuantity, ProductionUnit
// TODO-VERIFY[H] PP-003: completion element OrderIsTechnicallyCompleted (fallback: system status TECO)
// TODO-VERIFY[M] PP-004: elements Material, ProductionPlant, MRPController, ProductionSupervisor, ProductionVersion, MfgOrderPlannedStartDate, MfgOrderPlannedEndDate, MfgOrderActualReleaseDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Production Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ManufacturingOrder'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZPPV_I_ProductionOrder
  as select from I_ManufacturingOrder
  association [0..1] to I_Plant as _ProductionPlant on $projection.ProductionPlant = _ProductionPlant.Plant
{
  key ManufacturingOrder,
      ManufacturingOrderType,
      ManufacturingOrderCategory,
      Material,
      @ObjectModel.foreignKey.association: '_ProductionPlant'
      ProductionPlant,
      MRPController,
      ProductionSupervisor,
      ProductionVersion,
      ProductionUnit,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderPlannedTotalQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderPlannedScrapQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      MfgOrderConfirmedYieldQty,
      @Semantics.quantity.unitOfMeasure: 'ProductionUnit'
      ActualDeliveredQuantity,
      MfgOrderPlannedStartDate,
      MfgOrderPlannedEndDate,
      MfgOrderActualReleaseDate,
      OrderIsTechnicallyCompleted,
      CreationDate,
      CompanyCode,
      ProfitCenter,
      @EndUserText.label: 'Order Is Open'
      cast( case when OrderIsTechnicallyCompleted = '' then 'X' else ' ' end as abap_boolean ) as ProductionOrderIsOpen,

      /* Associations */
      _ProductionPlant
}
