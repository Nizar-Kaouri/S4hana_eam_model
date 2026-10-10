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
  key afih.aufnr as MaintenanceOrder,
      afih.ilart as MaintenanceActivityType,
      afih.priok as MaintPriority,
      afih.iwerk as MaintenancePlanningPlant,
      // TODO-VERIFY[M] XOR-001: AFIH field names INGPR, GEWRK, ILART, ANLZU, WARPL, WAPOS
      afih.ingpr as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XOR-002: AFIH-GEWRK and AFVC-ARBID hold the CRHD object ID of the work center
      afih.gewrk as MainWorkCenterInternalID,
      afih.qmnum as MaintenanceNotification,
      afih.equnr as Equipment,
      afih.iloan as LocAcctAssignment,
      afih.warpl as MaintenancePlan,
      afih.wapos as MaintenanceItem,
      afih.anlzu as MaintObjectSystemCondition,
      _LocAcctAssignment,
      _MainWorkCenter
}
