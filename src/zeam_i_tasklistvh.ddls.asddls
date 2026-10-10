// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for task lists (type, group, group counter, description).
// Example: Value help for TaskListGroup in maintenance item or task list analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Maintenance Task List - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'TaskListVersionCounter'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_I_TaskListVH
  as select from ZEAM_I_TaskList
{
  key TaskListType,
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key TaskListGroup,
  key TaskListGroupCounter,
  key TaskListVersionCounter,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      TaskListDesc,
      Plant,
      TaskListUsage,
      TaskListStatus,
      MaintenancePlannerGroup,
      AuthorizationGroup
}
