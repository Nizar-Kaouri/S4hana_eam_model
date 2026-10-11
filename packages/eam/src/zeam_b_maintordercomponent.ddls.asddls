// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per material component (reservation item) of a maintenance order with
//   requirement and withdrawn quantity.
// Example: Spare-part demand per plant and material; components still to be withdrawn for open orders.
// TODO-VERIFY[H] MO-C01: SAP released view for order components is I_MaintenanceOrderComponent (name not confirmed)
// TODO-VERIFY[H] MO-C02: key elements Reservation / ReservationItem (and whether ReservationRecordType is part of the key)
// TODO-VERIFY[H] MO-C03: quantity elements RequirementQuantityInBaseUnit, WithdrawnQuantity, BaseUnit
// TODO-VERIFY[M] MO-C04: elements MaintenanceOrder, MaintenanceOrderOperation, Material, Plant, StorageLocation, MatlCompRequirementDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order Component'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ReservationItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintOrderComponent
  as select from I_MaintenanceOrderComponent
  association [1..1] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.MaintenanceOrder = _MaintenanceOrder.MaintenanceOrder
  association [0..1] to I_Plant           as _Plant            on $projection.Plant = _Plant.Plant
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
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      WithdrawnQuantity,
      BaseUnit,

      /* Associations */
      _MaintenanceOrder,
      _Plant
}
