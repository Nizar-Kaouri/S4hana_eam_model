// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cost center assignments of work centers per validity period (needed to load the costing view of the work center).
// Example: Find work centers without a valid cost center: compare this view with ZEMX_I_WorkCenter.
@AbapCatalog.sqlViewName: 'ZEMX_WCK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center cost center (migration extract)'
@ObjectModel.representativeKey: 'CostCenterAssgmtCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_WorkCenterCostCtr
  as select from crco
    inner join crhd on crhd.objty = crco.objty and crhd.objid = crco.objid
{
  key crco.objid as WorkCenterInternalID,
      // TODO-VERIFY[H] XWC-004: CRCO key structure (OBJTY, OBJID, LASET, ENDDA, LANUM) and field names
  key crco.laset as ActivityTypeSet,
  key crco.endda as ValidityEndDate,
  key crco.lanum as CostCenterAssgmtCounter,
      crhd.arbpl as WorkCenter,
      crhd.werks as Plant,
      crco.begda as ValidityStartDate,
      crco.kokrs as ControllingArea,
      crco.kostl as CostCenter
}
where crco.objty = 'A'
