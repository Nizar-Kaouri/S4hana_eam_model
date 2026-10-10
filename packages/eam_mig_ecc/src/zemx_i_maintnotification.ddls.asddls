// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per PM notification (QMEL with maintenance data QMIH) with reference object, planning data, malfunction data and completion / deletion flags for the migration scope.
// Example: Extract the open notifications: filter IsCompleted = '' and IsMarkedForDeletion = ''.
// TODO-VERIFY[M] XNO-003: every PM notification has a QMIH row and quality / service notifications without maintenance data are excluded by the inner join
@AbapCatalog.sqlViewName: 'ZEMX_NO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance notification (migration extract)'
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintNotification
  as select from qmel
    inner join qmih on qmih.qmnum = qmel.qmnum
    left outer join iloa on iloa.iloan = qmih.iloan
    left outer join crhd as wc on wc.objid = qmel.arbpl and wc.objty = 'A'
    left outer join jest as noco on noco.objnr = qmel.objnr and noco.stat = 'I0072' and noco.inact = ''
    left outer join jest as dlfl on dlfl.objnr = qmel.objnr and dlfl.stat = 'I0076' and dlfl.inact = ''
{
  key qmel.qmnum                     as MaintenanceNotification,
      qmel.qmart                     as NotificationType,
      qmel.qmtxt                     as NotificationText,
      qmel.priok                     as MaintPriority,
      qmel.artpr                     as MaintPriorityType,
      qmel.qmdat                     as NotificationDate,
      qmel.mzeit                     as NotificationTime,
      qmel.qmnam                     as ReportedByUser,
      qmel.strmn                     as RequiredStartDate,
      qmel.ltrmn                     as RequiredEndDate,
      // TODO-VERIFY[M] XNO-001: QMEL field names ARTPR, QMKAT, QMGRP, QMCOD, STRMN, LTRMN, QMNAM
      qmel.qmkat                     as NotificationCatalog,
      qmel.qmgrp                     as NotificationCodeGroup,
      qmel.qmcod                     as NotificationCode,
      qmel.aufnr                     as MaintenanceOrder,
      qmih.equnr                     as Equipment,
      iloa.tplnr                     as FunctionalLocation,
      qmih.iwerk                     as MaintenancePlanningPlant,
      qmih.ingrp                     as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XNO-002: QMEL-ARBPL holds the CRHD object ID of the main work center
      wc.arbpl                       as MainWorkCenter,
      wc.werks                       as MainWorkCenterPlant,
      iloa.swerk                     as MaintenancePlant,
      iloa.beber                     as PlantSection,
      qmih.msaus                     as MaintenanceObjectIsDown,
      qmih.ausvn                     as MalfunctionStartDate,
      qmih.auztv                     as MalfunctionStartTime,
      qmih.ausbs                     as MalfunctionEndDate,
      qmih.auztb                     as MalfunctionEndTime,
      qmel.objnr                     as ObjectNumber,
      case noco.stat when 'I0072' then 'X' else '' end as IsCompleted,
      case dlfl.stat when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      qmel.erdat                     as CreationDate,
      qmel.ernam                     as CreatedByUser,
      qmel.aedat                     as LastChangeDate
}
