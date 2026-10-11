// ModuPorter EAM migration | Release 1.0.0
// Purpose: Task-list object allocation change states; customer resolves validity at cutover.
// Example: Find the task lists of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_EPLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list assignment change states'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_B_EquipTaskListAsgmt
  as select from eapl as src
{
      // Compatibility note: Verify EAPL fields and complete keys (including ZKRIZ/ZAEHL) in source DDIC.
      @EndUserText.label: 'Task list type'
  key src.plnty as TaskListType,
      @EndUserText.label: 'Task list group'
  key src.plnnr as TaskListGroup,
      @EndUserText.label: 'Group counter'
  key src.plnal as TaskListGroupCounter,
      @EndUserText.label: 'Equipment'
  key src.equnr as Equipment,
      @EndUserText.label: 'Additional criteria counter'
  key src.zkriz as AdditionalCriteriaCounter,
      @EndUserText.label: 'Assignment state counter'
  key src.zaehl as AssignmentCounter,
      @EndUserText.label: 'FunctionalLocation'
      cast( '' as abap.char(30) ) as FunctionalLocation,
      @EndUserText.label: 'Marked for deletion'
      src.loekz as IsMarkedForDeletion
}
