// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
{
  key mpos.wapos as MaintenanceItem,
      mpos.warpl as MaintenancePlan,
      mpos.pstxt as MaintenanceItemDescription,
      mpos.equnr as Equipment,
      mpos.tplnr as FunctionalLocation,
      mpos.iwerk as MaintenancePlanningPlant,
      // TODO-VERIFY[M] XPL-003: MPOS field names WPGRP, GEWRK, QMART, ILART, PRIOK, ERSDT, AEDAT
      mpos.wpgrp as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XPL-004: MPOS-GEWRK holds the CRHD object ID of the main work center
      mpos.gewrk as MainWorkCenterInternalID,
      mpos.auart as MaintenanceOrderType,
      mpos.qmart as NotificationType,
      mpos.ilart as MaintenanceActivityType,
      mpos.priok as MaintPriority,
      mpos.plnty as TaskListType,
      mpos.plnnr as TaskListGroup,
      mpos.plnal as TaskListGroupCounter,
      mpos.iloan as LocAcctAssignment,
      mpos.ersdt as CreationDate,
      mpos.aedat as LastChangeDate
}
