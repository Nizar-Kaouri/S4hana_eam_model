// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectPlanMatData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectPlanMatData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_InspectPlanMatData
  as select from mapl as src
{
  key src.matnr as Material,
  key src.werks as Plant,
  key src.plnty as TaskListType,
  key src.plnnr as TaskListGroup,
  key src.plnal as TaskListGroupCounter,
  key src.zaehl as InternalCounter,
      src.datuv as ValidFromDate,
      src.loekz as DeletionFlag
}
