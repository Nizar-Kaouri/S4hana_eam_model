// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance items with reference object, planning data, order / notification type and the assigned task list.
// Example: Extract the items of the plans in scope: join on MaintenancePlan with ZEMX_I_MaintenancePlan.
@AbapCatalog.sqlViewName: 'ZEMX_PLI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance item (migration extract)'
@ObjectModel.representativeKey: 'MaintenanceItem'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintenanceItem
  as select from mpos
    left outer join iloa on iloa.iloan = mpos.iloan
    left outer join crhd as wc on wc.objid = mpos.gewrk and wc.objty = 'A'
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
      wc.arbpl   as MainWorkCenter,
      wc.werks   as MainWorkCenterPlant,
      mpos.auart as MaintenanceOrderType,
      mpos.qmart as NotificationType,
      mpos.ilart as MaintenanceActivityType,
      mpos.priok as MaintPriority,
      mpos.plnty as TaskListType,
      mpos.plnnr as TaskListGroup,
      mpos.plnal as TaskListGroupCounter,
      iloa.gsber as BusinessArea,
      mpos.ersdt as CreationDate,
      mpos.aedat as LastChangeDate
}
