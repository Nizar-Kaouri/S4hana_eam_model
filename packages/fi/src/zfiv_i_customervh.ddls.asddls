// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for customers (number, name, city).
// Example: Value help for Customer in receivables and sales queries.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Customer - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Customer'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZFIV_I_CustomerVH
  as select from ZFIV_I_Customer
{
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key Customer,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      CustomerName,
      Country,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      CityName,
      CustomerAccountGroup,
      AuthorizationGroup
}
