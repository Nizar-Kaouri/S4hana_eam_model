// ModuPorter EAM migration | Release 1.0.0
// Purpose: Work center descriptions (CRTX) per language for object type 'A'.
// Example: Read the English description of work center object 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_CRTX'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Work center description'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_WorkCenterDesc
  as select from crtx
  association [0..1] to ZEMX_I_WorkCenterHeader as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Work Center Internal ID'
  key crtx.objid as WorkCenterInternalID,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key crtx.spras as Language,
      @Semantics.text: true
      @EndUserText.label: 'Work Center Text'
      crtx.ktext as WorkCenterText,
      _WorkCenter
}
where crtx.objty = 'A'
