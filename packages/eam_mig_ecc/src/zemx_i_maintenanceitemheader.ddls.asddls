// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance items (MPOS) with reference object, planning data, order / notification type and task list.
// Example: Read the items of maintenance plan 100.
@AbapCatalog.sqlViewName: 'ZEMX_MPOS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance item header'
@ObjectModel.representativeKey: 'MaintenanceItem'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintenanceItemHeader
  as select from mpos
  association [0..1] to ZEMX_I_LocAcctAssignment as _LocAcctAssignment on $projection.LocAcctAssignment = _LocAcctAssignment.LocAcctAssignment
  association [0..1] to ZEMX_I_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Maintenance Item'
  key mpos.wapos as MaintenanceItem,
      @EndUserText.label: 'Maintenance Plan'
      mpos.warpl as MaintenancePlan,
      @EndUserText.label: 'Maintenance Item Description'
      mpos.pstxt as MaintenanceItemDescription,
      @EndUserText.label: 'Equipment'
      mpos.equnr as Equipment,
      @EndUserText.label: 'Functional Location'
      mpos.tplnr as FunctionalLocation,
      @EndUserText.label: 'Maintenance Planning Plant'
      mpos.iwerk as MaintenancePlanningPlant,
      // Compatibility note: MPOS field names WPGRP, GEWRK, QMART, ILART, PRIOK, ERSDT, AEDAT
      @EndUserText.label: 'Maintenance Planner Group'
      mpos.wpgrp as MaintenancePlannerGroup,
      // Compatibility note: MPOS-GEWRK holds the CRHD object ID of the main work center
      @EndUserText.label: 'Main Work Center Internal ID'
      mpos.gewrk as MainWorkCenterInternalID,
      @EndUserText.label: 'Maintenance Order Type'
      mpos.auart as MaintenanceOrderType,
      @EndUserText.label: 'Notification Type'
      mpos.qmart as NotificationType,
      @EndUserText.label: 'Maintenance Activity Type'
      mpos.ilart as MaintenanceActivityType,
      @EndUserText.label: 'Maint Priority'
      mpos.priok as MaintPriority,
      @EndUserText.label: 'Task List Type'
      mpos.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
      mpos.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
      mpos.plnal as TaskListGroupCounter,
      @EndUserText.label: 'Loc Acct Assignment'
      mpos.iloan as LocAcctAssignment,
      @EndUserText.label: 'Creation Date'
      mpos.ersdt as CreationDate,
      @EndUserText.label: 'Last Change Date'
      mpos.aedat as LastChangeDate,
      _LocAcctAssignment,
      _MainWorkCenter
}
