// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for projects (external number and description).
// Example: Value help for projects in cost analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Project - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'ProjectInternalID'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZPSV_B_ProjectVH
  as select from ZPSV_B_Project
{
      @ObjectModel.text.element: [ 'ProjectDescription' ]
  key ProjectInternalID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      Project,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      ProjectDescription,
      ProjectProfileCode,
      ProcessingStatus,
      CompanyCode,
      ControllingArea,
      ProfitCenter,
      ResponsibleCostCenter,
      Plant
}
