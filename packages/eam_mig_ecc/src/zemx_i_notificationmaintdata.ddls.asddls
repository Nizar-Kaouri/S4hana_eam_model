// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance data of PM notifications (QMIH): reference object, planning plant, planner group, breakdown and malfunction data.
// Example: Read the breakdowns: filter MaintenanceObjectIsDown = 'X'.
// TODO-VERIFY[M] XNO-003: every PM notification has a QMIH row; quality / service notifications without maintenance data are excluded by the inner join in the composite views
@AbapCatalog.sqlViewName: 'ZEMX_QMIH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Notification maintenance data'
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_NotificationMaintData
  as select from qmih
  association [0..1] to ZEMX_I_LocAcctAssignment as _LocAcctAssignment on $projection.LocAcctAssignment = _LocAcctAssignment.LocAcctAssignment
{
  key qmih.qmnum as MaintenanceNotification,
      qmih.equnr as Equipment,
      qmih.iloan as LocAcctAssignment,
      qmih.iwerk as MaintenancePlanningPlant,
      qmih.ingrp as MaintenancePlannerGroup,
      qmih.msaus as MaintenanceObjectIsDown,
      qmih.ausvn as MalfunctionStartDate,
      qmih.auztv as MalfunctionStartTime,
      qmih.ausbs as MalfunctionEndDate,
      qmih.auztb as MalfunctionEndTime,
      _LocAcctAssignment
}
