// ModuPorter EAM migration | Release 1.0.0
// Purpose: Cost center assignments of work centers per validity period (CRCO).
// Example: Read the cost center of work center object 10000001 valid today.
@AbapCatalog.sqlViewName: 'ZEMX_CRCO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Work center cost center assignment'
@ObjectModel.representativeKey: 'CostCenterAssgmtCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_B_WorkCenterCostAssgmt
  as select from crco
  association [0..1] to ZEMX_B_WorkCenterHeader as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Work Center Internal ID'
  key crco.objid as WorkCenterInternalID,
      // Compatibility note: CRCO key structure (OBJTY, OBJID, LASET, ENDDA, LANUM) and field names
      @EndUserText.label: 'Activity Type Set'
  key crco.laset as ActivityTypeSet,
      @EndUserText.label: 'Validity End Date'
  key crco.endda as ValidityEndDate,
      @EndUserText.label: 'Cost Center Assgmt Counter'
  key crco.lanum as CostCenterAssgmtCounter,
      @EndUserText.label: 'Validity Start Date'
      crco.begda as ValidityStartDate,
      @EndUserText.label: 'Controlling Area'
      crco.kokrs as ControllingArea,
      @EndUserText.label: 'Cost Center'
      crco.kostl as CostCenter,
      _WorkCenter
}
where crco.objty = 'A'
