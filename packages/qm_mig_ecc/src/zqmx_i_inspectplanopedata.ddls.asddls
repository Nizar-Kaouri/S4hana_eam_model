// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectPlanOpeData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectPlanOpeData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_InspectPlanOpeData
  as select from plpo as src
{
  key src.plnty as TaskListType,
  key src.plnnr as TaskListGroup,
  key src.plnkn as TaskListNode,
  key src.zaehl as InternalCounter,
      src.datuv as ValidFromDate,
      src.loekz as DeletionFlag,
      src.vornr as Operation,
      src.ktext as OperationText
}
