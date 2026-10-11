// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Component cube with requirement, withdrawn and open quantity per material, plus order
//   header characteristics via path expressions.
// Example: Spare-part demand per plant/material for open orders; open withdrawals per storage location.
// TODO-VERIFY[M] MO-R03: arithmetic on two quantity elements cast to abap.quan with the same unit reference
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order Component - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_MaintOrderComponent
  as select from ZEAM_B_MaintOrderComponent
{
  key Reservation,
  key ReservationItem,
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
      MaintenanceOrder,
      MaintenanceOrderOperation,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      StorageLocation,
      MatlCompRequirementDate,
      BaseUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequirementQuantityInBaseUnit,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      WithdrawnQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Quantity'
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      cast( case when RequirementQuantityInBaseUnit > WithdrawnQuantity
                 then cast( RequirementQuantityInBaseUnit as abap.dec( 13, 3 ) ) - cast( WithdrawnQuantity as abap.dec( 13, 3 ) )
                 else cast( 0 as abap.dec( 13, 3 ) ) end as abap.quan( 13, 3 ) ) as OpenQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Components'
      cast( 1 as abap.int4 ) as NumberOfComponents,

      /* Order header characteristics */
      _MaintenanceOrder.MaintenanceOrderType,
      _MaintenanceOrder.MaintenancePlanningPlant,
      _MaintenanceOrder.MaintenancePlant,
      _MaintenanceOrder.MaintOrderIsOpen,
      _MaintenanceOrder.CompanyCode,
      _MaintenanceOrder.BusinessArea,
      _MaintenanceOrder.CostCenter,

      /* Associations */
      _MaintenanceOrder,
      _Plant
}
