// ModuPorter PP migration | Release 1.0.0
// Purpose: Read RoutingHeaderData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V011'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RoutingHeaderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_RoutingHeaderData
  as select from plko as src
{
  key src.plnty as TaskListType,
  key src.plnnr as TaskListGroup,
  key src.plnal as TaskListGroupCounter,
  key src.zaehl as InternalCounter,
      src.datuv as ValidFromDate,
      src.aennr as ChangeNumber,
      src.loekz as DeletionFlag,
      src.ktext as TaskListDescription
}
