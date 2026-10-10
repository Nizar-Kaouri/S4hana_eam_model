// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_WorkCenterCostAssgmt
  as select from crco
{
  key crco.objid as WorkCenterInternalID,
      // TODO-VERIFY[H] XWC-004: CRCO key structure (OBJTY, OBJID, LASET, ENDDA, LANUM) and field names
  key crco.laset as ActivityTypeSet,
  key crco.endda as ValidityEndDate,
  key crco.lanum as CostCenterAssgmtCounter,
      crco.begda as ValidityStartDate,
      crco.kokrs as ControllingArea,
      crco.kostl as CostCenter
}
where crco.objty = 'A'
