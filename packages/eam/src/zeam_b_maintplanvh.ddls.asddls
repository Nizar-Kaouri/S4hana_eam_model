// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for maintenance plans (number and description).
// Example: Value help for MaintenancePlan in order or item analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Maintenance Plan - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #M,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintPlanVH
  as select from ZEAM_B_MaintPlan
{
      @ObjectModel.text.element: [ 'MaintenancePlanDesc' ]
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key MaintenancePlan,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      MaintenancePlanDesc,
      MaintenancePlanCategory,
      MaintenanceStrategy,
      MaintenancePlanIsInactive,
      AuthorizationGroup
}
