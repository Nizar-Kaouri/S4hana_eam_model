// ModuPorter QM migration | Release 1.0.0
// Purpose: Read InspectPlanMatData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectPlanMatData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_B_InspectPlanMatData
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
