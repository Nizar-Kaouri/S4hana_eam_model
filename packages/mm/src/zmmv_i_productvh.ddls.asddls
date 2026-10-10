// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for products with the description in the logon language.
// Example: Value help for Material / Product elements in stock and purchasing queries.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Product - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Product'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZMMV_I_ProductVH
  as select from ZMMV_I_Product
{
      @ObjectModel.text.element: [ 'ProductDescription' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key Product,
      ProductType,
      ProductGroup,
      BaseUnit,
      AuthorizationGroup,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      _Text[1: Language = $session.system_language].ProductDescription as ProductDescription
}
