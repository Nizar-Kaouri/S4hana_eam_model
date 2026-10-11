// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order cube enriched with technical object master data: foreign keys to the
//   equipment and functional location dimensions (navigation attributes) and selected attributes as
//   plain characteristics (equipment category, ABC indicator, manufacturer, location category).
// Example: Number of corrective orders per equipment category and manufacturer; orders per ABC indicator.
// LINK VIEW (ships only when modules "maintenance_order" AND "equipment" AND "functional_location" are selected).
// TODO-VERIFY[M] LNK-011: a #CUBE selecting from another #CUBE with re-declared measures and new foreign key associations
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order with Technical Object'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_MaintOrderWithTechObj
  as select from ZEAM_I_MaintOrder
  association [0..1] to ZEAM_B_Equipment as _Equipment          on $projection.Equipment = _Equipment.Equipment
  association [0..1] to ZEAM_B_FuncLoc   as _FunctionalLocation on $projection.FunctionalLocation = _FunctionalLocation.FunctionalLocation
{
  key MaintenanceOrder,
      MaintenanceOrderType,
      MaintenanceActivityType,
      MaintPriority,
      MaintOrderIsOpen,
      CreationDate,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      MainWorkCenter,
      CompanyCode,
      BusinessArea,
      CostCenter,
      @ObjectModel.foreignKey.association: '_Equipment'
      Equipment,
      @ObjectModel.foreignKey.association: '_FunctionalLocation'
      FunctionalLocation,

      /* Measures */
      @Aggregation.default: #SUM
      NumberOfOrders,
      @Aggregation.default: #SUM
      NumberOfOpenOrders,
      @Aggregation.default: #SUM
      PlannedDurationInDays,

      /* Technical object attributes (path expressions) */
      _Equipment.EquipmentCategory,
      _Equipment.TechnicalObjectType,
      _Equipment.ABCIndicator,
      _Equipment.AssetManufacturerName,
      _Equipment.ConstructionYear,
      _FunctionalLocation.FunctionalLocationCategory,
      _FunctionalLocation.FunctionalLocationLabelName,

      /* Associations */
      _Equipment,
      _FunctionalLocation
}
