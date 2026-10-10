// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per supplier: name, account group, country, city, postal code, authorization group, posting
//   block and creation date; dimension for payables and purchasing.
// Example: Payables per supplier country; blocked suppliers.
// TODO-VERIFY[M] FI-020: I_Supplier elements SupplierName, SupplierAccountGroup, Country, CityName, PostalCode, AuthorizationGroup, PostingIsBlocked
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Supplier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Supplier'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZFIV_I_Supplier
  as select from I_Supplier
{
      @ObjectModel.text.element: [ 'SupplierName' ]
  key Supplier,
      @Semantics.text: true
      SupplierName,
      SupplierAccountGroup,
      Country,
      CityName,
      PostalCode,
      AuthorizationGroup,
      PostingIsBlocked,
      CreationDate
}
