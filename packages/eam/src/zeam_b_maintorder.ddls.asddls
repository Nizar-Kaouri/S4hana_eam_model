// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance order header with type, activity type, priority, process phase,
//   planning and cost-assignment data, basic dates and a derived open/closed flag; analytical
//   dimension for operation, component, cost and backlog cubes.
// Example: List open preventive orders per planning plant; join cost line items to order attributes.
// Equipment, functional location, notification and maintenance plan are plain fields here; their
// associations live in link views (ZEAM_I_*WithOrder, ZEAM_B_NotifWithOrder, ZEAM_B_MaintPlanWithOrder).
// TODO-VERIFY[M] MO-001: I_MaintenanceOrder exists, is released (C1) and its key element is MaintenanceOrder
// TODO-VERIFY[M] MO-002: element names MaintenanceOrderType, MaintenanceOrderDesc, MaintPriority, MaintenanceActivityType
// TODO-VERIFY[M] MO-003: MaintOrdProcessPhaseCode element name and value list
// TODO-VERIFY[H] MO-004: technical completion date element (AUFK-IDAT2 equivalent) assumed TechnicalCompletionDate; drives MaintOrderIsOpen
// TODO-VERIFY[M] MO-005: planning elements MaintenancePlanningPlant, MaintenancePlannerGroup, MaintenancePlant, MainWorkCenter, MainWorkCenterPlant
// TODO-VERIFY[M] MO-006: account assignment elements CompanyCode, BusinessArea, ControllingArea, CostCenter
// TODO-VERIFY[M] MO-007: reference elements MaintenanceNotification, Equipment, FunctionalLocation, MaintenancePlan, MaintenanceItem
// TODO-VERIFY[M] MO-008: date elements MaintOrdBasicStartDate, MaintOrdBasicEndDate, CreationDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintOrder
  as select from I_MaintenanceOrder
  association [0..1] to I_Plant       as _MaintenancePlant         on $projection.MaintenancePlant = _MaintenancePlant.Plant
  association [0..1] to I_Plant       as _MaintenancePlanningPlant on $projection.MaintenancePlanningPlant = _MaintenancePlanningPlant.Plant
  association [0..1] to I_CompanyCode as _CompanyCode              on $projection.CompanyCode = _CompanyCode.CompanyCode
{
      @ObjectModel.text.element: [ 'MaintenanceOrderDesc' ]
  key MaintenanceOrder,
      @Semantics.text: true
      MaintenanceOrderDesc,
      MaintenanceOrderType,
      MaintenanceActivityType,
      MaintPriority,
      MaintOrdProcessPhaseCode,
      TechnicalCompletionDate,
      cast( case when TechnicalCompletionDate = '00000000' then 'X' else ' ' end as abap_boolean ) as MaintOrderIsOpen,
      MaintOrdBasicStartDate,
      MaintOrdBasicEndDate,
      CreationDate,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      MainWorkCenter,
      MainWorkCenterPlant,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,
      MaintenanceNotification,
      Equipment,
      FunctionalLocation,
      MaintenancePlan,
      MaintenanceItem,

      /* Associations */
      _MaintenancePlant,
      _MaintenancePlanningPlant,
      _CompanyCode
}
