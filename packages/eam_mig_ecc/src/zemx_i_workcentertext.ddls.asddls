// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work center descriptions in every maintained language, with the business key (work center + plant) the target system needs.
// Example: Extract the German and English texts: filter Language = 'D' or 'E'.
@AbapCatalog.sqlViewName: 'ZEMX_WCT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center text (migration extract)'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_WorkCenterText
  as select from crtx
    inner join crhd on crhd.objty = crtx.objty and crhd.objid = crtx.objid
{
  key crtx.objid as WorkCenterInternalID,
      @Semantics.language: true
  key crtx.spras as Language,
      crhd.arbpl as WorkCenter,
      crhd.werks as Plant,
      @Semantics.text: true
      crtx.ktext as WorkCenterText
}
where crtx.objty = 'A'
