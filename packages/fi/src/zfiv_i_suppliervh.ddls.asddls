// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for suppliers (number, name, city).
// Example: Value help for Supplier in payables and purchasing queries.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Supplier - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Supplier'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZFIV_I_SupplierVH
  as select from ZFIV_I_Supplier
{
      @ObjectModel.text.element: [ 'SupplierName' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key Supplier,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      SupplierName,
      Country,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      CityName,
      SupplierAccountGroup,
      AuthorizationGroup
}
