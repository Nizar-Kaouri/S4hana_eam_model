// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for sales orders (number, customer reference, sold-to party).
// Example: Value help for SalesDocument in delivery and billing analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Sales Order - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'SalesDocument'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZSDV_B_SalesOrderVH
  as select from ZSDV_B_SalesOrder
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key SalesDocument,
      SalesDocumentType,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      SoldToParty,
      SalesOrganization,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      PurchaseOrderByCustomer,
      SalesDocumentDate
}
