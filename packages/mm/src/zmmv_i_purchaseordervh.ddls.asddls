// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for purchase orders (number, supplier, purchasing organization).
// Example: Value help for PurchaseOrder in goods movement or invoice analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Purchase Order - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'PurchaseOrder'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZMMV_I_PurchaseOrderVH
  as select from ZMMV_I_PurchaseOrder
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key PurchaseOrder,
      PurchaseOrderType,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      Supplier,
      PurchasingOrganization,
      PurchasingGroup,
      CompanyCode,
      PurchaseOrderDate
}
