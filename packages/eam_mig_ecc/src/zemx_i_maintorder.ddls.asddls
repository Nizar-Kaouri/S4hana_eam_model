// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance order (order category 30) with planning data, reference object, account assignment and the status flags that decide the migration scope.
// Example: Extract the open orders: filter IsTechnicallyCompleted = '', IsClosed = '' and IsMarkedForDeletion = ''.
// TODO-VERIFY[M] XOR-003: maintenance orders have order category AUFK-AUTYP = '30'
@AbapCatalog.sqlViewName: 'ZEMX_OR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance order (migration extract)'
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintOrder
  as select from aufk
    inner join afih on afih.aufnr = aufk.aufnr
    inner join afko on afko.aufnr = aufk.aufnr
    left outer join iloa on iloa.iloan = afih.iloan
    left outer join crhd as wc on wc.objid = afih.gewrk and wc.objty = 'A'
    left outer join jest as teco on teco.objnr = aufk.objnr and teco.stat = 'I0045' and teco.inact = ''
    left outer join jest as clsd on clsd.objnr = aufk.objnr and clsd.stat = 'I0046' and clsd.inact = ''
    left outer join jest as dlfl on dlfl.objnr = aufk.objnr and dlfl.stat = 'I0076' and dlfl.inact = ''
{
  key aufk.aufnr                     as MaintenanceOrder,
      aufk.auart                     as MaintenanceOrderType,
      aufk.ktext                     as MaintenanceOrderDesc,
      afih.ilart                     as MaintenanceActivityType,
      afih.priok                     as MaintPriority,
      afko.gstrp                     as MaintOrdBasicStartDate,
      afko.gltrp                     as MaintOrdBasicEndDate,
      afih.iwerk                     as MaintenancePlanningPlant,
      // TODO-VERIFY[M] XOR-001: AFIH field names INGPR, GEWRK, ILART, ANLZU, WARPL, WAPOS
      afih.ingpr                     as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XOR-002: AFIH-GEWRK and AFVC-ARBID hold the CRHD object ID of the work center
      wc.arbpl                       as MainWorkCenter,
      wc.werks                       as MainWorkCenterPlant,
      iloa.swerk                     as MaintenancePlant,
      aufk.bukrs                     as CompanyCode,
      aufk.gsber                     as BusinessArea,
      aufk.kokrs                     as ControllingArea,
      aufk.kostv                     as ResponsibleCostCenter,
      iloa.kostl                     as CostCenter,
      afih.qmnum                     as MaintenanceNotification,
      afih.equnr                     as Equipment,
      iloa.tplnr                     as FunctionalLocation,
      afih.warpl                     as MaintenancePlan,
      afih.wapos                     as MaintenanceItem,
      afih.anlzu                     as MaintObjectSystemCondition,
      afko.aufpl                     as OrderRoutingNumber,
      afko.plnty                     as TaskListType,
      afko.plnnr                     as TaskListGroup,
      afko.plnal                     as TaskListGroupCounter,
      aufk.waers                     as Currency,
      aufk.objnr                     as ObjectNumber,
      case teco.stat when 'I0045' then 'X' else '' end as IsTechnicallyCompleted,
      case clsd.stat when 'I0046' then 'X' else '' end as IsClosed,
      case dlfl.stat when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      aufk.erdat                     as CreationDate,
      aufk.ernam                     as CreatedByUser,
      aufk.aedat                     as LastChangeDate
}
where aufk.autyp = '30'
