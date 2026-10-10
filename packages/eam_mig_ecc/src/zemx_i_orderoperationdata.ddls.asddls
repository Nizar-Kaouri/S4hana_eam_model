// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Order operations (AFVC): number, control key, text, work center, plant, activity type.
// Example: Read the operations of routing number 1000001.
@AbapCatalog.sqlViewName: 'ZEMX_AFVC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order operation'
@ObjectModel.representativeKey: 'OrderOperationInternalID'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_OrderOperationData
  as select from afvc
  association [0..1] to ZEMX_I_WorkCenterHeader as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
  key afvc.aufpl as OrderRoutingNumber,
  key afvc.aplzl as OrderOperationInternalID,
      afvc.vornr as MaintenanceOrderOperation,
      // TODO-VERIFY[M] XOR-004: AFVC field names UVORN, LARNT, ARBID and AFVV field names ARBEI, ARBEH, DAUNO, DAUNE
      afvc.uvorn as MaintenanceOrderSubOperation,
      afvc.ltxa1 as OperationDescription,
      afvc.steus as OperationControlKey,
      afvc.arbid as WorkCenterInternalID,
      afvc.werks as Plant,
      afvc.larnt as ActivityType,
      afvc.objnr as ObjectNumber,
      _WorkCenter
}
