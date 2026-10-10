// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance data of orders (AFIH): reference object, planning data, notification, maintenance plan.
// Example: Read the orders created from maintenance plan 100.
@AbapCatalog.sqlViewName: 'ZEMX_AFIH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order maintenance data'
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_OrderMaintData
  as select from afih
  association [0..1] to ZEMX_I_LocAcctAssignment as _LocAcctAssignment on $projection.LocAcctAssignment = _LocAcctAssignment.LocAcctAssignment
  association [0..1] to ZEMX_I_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Maintenance Order'
  key afih.aufnr as MaintenanceOrder,
      @EndUserText.label: 'Maintenance Activity Type'
      afih.ilart as MaintenanceActivityType,
      @EndUserText.label: 'Maint Priority'
      afih.priok as MaintPriority,
      @EndUserText.label: 'Maintenance Planning Plant'
      afih.iwerk as MaintenancePlanningPlant,
      // TODO-VERIFY[M] XOR-001: AFIH field names INGPR, GEWRK, ILART, ANLZU, WARPL, WAPOS
      @EndUserText.label: 'Maintenance Planner Group'
      afih.ingpr as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XOR-002: AFIH-GEWRK and AFVC-ARBID hold the CRHD object ID of the work center
      @EndUserText.label: 'Main Work Center Internal ID'
      afih.gewrk as MainWorkCenterInternalID,
      @EndUserText.label: 'Maintenance Notification'
      afih.qmnum as MaintenanceNotification,
      @EndUserText.label: 'Equipment'
      afih.equnr as Equipment,
      @EndUserText.label: 'Loc Acct Assignment'
      afih.iloan as LocAcctAssignment,
      @EndUserText.label: 'Maintenance Plan'
      afih.warpl as MaintenancePlan,
      @EndUserText.label: 'Maintenance Item'
      afih.wapos as MaintenanceItem,
      @EndUserText.label: 'Maint Object System Condition'
      afih.anlzu as MaintObjectSystemCondition,
      _LocAcctAssignment,
      _MainWorkCenter
}
