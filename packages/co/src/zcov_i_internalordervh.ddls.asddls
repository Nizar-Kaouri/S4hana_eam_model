// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for internal orders (number and description).
// Example: Value help for internal orders in cost queries.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Internal Order - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'InternalOrder'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZCOV_I_InternalOrderVH
  as select from ZCOV_I_InternalOrder
{
      @ObjectModel.text.element: [ 'InternalOrderDescription' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key InternalOrder,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      InternalOrderDescription,
      OrderType,
      ControllingArea,
      CompanyCode,
      ResponsibleCostCenter,
      ProfitCenter
}
