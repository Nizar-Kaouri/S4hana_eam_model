// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operations and sub-operations of maintenance orders with control key, work center, activity type, planned work and duration.
// Example: Extract the operations of the open orders: join on MaintenanceOrder with ZEMX_I_MaintOrder.
@AbapCatalog.sqlViewName: 'ZEMX_ORO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance order operation (migration extract)'
@ObjectModel.representativeKey: 'OrderOperationInternalID'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintOrderOperation
  as select from afvc
    inner join afvv on afvv.aufpl = afvc.aufpl and afvv.aplzl = afvc.aplzl
    inner join afko on afko.aufpl = afvc.aufpl
    inner join afih on afih.aufnr = afko.aufnr
    left outer join crhd as wc on wc.objid = afvc.arbid and wc.objty = 'A'
{
  key afko.aufnr as MaintenanceOrder,
  key afvc.aplzl as OrderOperationInternalID,
      afvc.aufpl as OrderRoutingNumber,
      afvc.vornr as MaintenanceOrderOperation,
      // TODO-VERIFY[M] XOR-004: AFVC field names UVORN, LARNT, ARBID and AFVV field names ARBEI, ARBEH, DAUNO, DAUNE
      afvc.uvorn as MaintenanceOrderSubOperation,
      afvc.ltxa1 as OperationDescription,
      afvc.steus as OperationControlKey,
      wc.arbpl   as WorkCenter,
      wc.werks   as WorkCenterPlant,
      afvc.werks as Plant,
      afvc.larnt as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      afvv.arbei as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      afvv.arbeh as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      afvv.dauno as OperationDuration,
      @Semantics.unitOfMeasure: true
      afvv.daune as OperationDurationUnit,
      afvc.objnr as ObjectNumber
}
