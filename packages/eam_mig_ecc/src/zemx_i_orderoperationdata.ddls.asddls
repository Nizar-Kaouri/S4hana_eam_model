// ModuPorter EAM migration | Release 1.0.0
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
      @EndUserText.label: 'Order Routing Number'
  key afvc.aufpl as OrderRoutingNumber,
      @EndUserText.label: 'Order Operation Internal ID'
  key afvc.aplzl as OrderOperationInternalID,
      @EndUserText.label: 'Maintenance Order Operation'
      afvc.vornr as MaintenanceOrderOperation,
      // Compatibility note: AFVC field names UVORN, LARNT, ARBID and AFVV field names ARBEI, ARBEH, DAUNO, DAUNE
      @EndUserText.label: 'Maintenance Order Sub Operation'
      afvc.uvorn as MaintenanceOrderSubOperation,
      @EndUserText.label: 'Operation Description'
      afvc.ltxa1 as OperationDescription,
      @EndUserText.label: 'Operation Control Key'
      afvc.steus as OperationControlKey,
      @EndUserText.label: 'Work Center Internal ID'
      afvc.arbid as WorkCenterInternalID,
      @EndUserText.label: 'Plant'
      afvc.werks as Plant,
      @EndUserText.label: 'Activity Type'
      afvc.larnt as ActivityType,
      @EndUserText.label: 'Object Number'
      afvc.objnr as ObjectNumber,
      _WorkCenter
}
