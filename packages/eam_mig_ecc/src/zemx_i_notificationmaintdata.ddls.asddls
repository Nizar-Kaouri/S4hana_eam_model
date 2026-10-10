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
      @EndUserText.label: 'Maintenance Notification'
  key qmih.qmnum as MaintenanceNotification,
      @EndUserText.label: 'Equipment'
      qmih.equnr as Equipment,
      @EndUserText.label: 'Loc Acct Assignment'
      qmih.iloan as LocAcctAssignment,
      @EndUserText.label: 'Maintenance Planning Plant'
      qmih.iwerk as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      qmih.ingrp as MaintenancePlannerGroup,
      @EndUserText.label: 'Maintenance Object Is Down'
      qmih.msaus as MaintenanceObjectIsDown,
      @EndUserText.label: 'Malfunction Start Date'
      qmih.ausvn as MalfunctionStartDate,
      @EndUserText.label: 'Malfunction Start Time'
      qmih.auztv as MalfunctionStartTime,
      @EndUserText.label: 'Malfunction End Date'
      qmih.ausbs as MalfunctionEndDate,
      @EndUserText.label: 'Malfunction End Time'
      qmih.auztb as MalfunctionEndTime,
      _LocAcctAssignment
}
