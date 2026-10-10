// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per customer: name, account group, country, city, postal code, authorization group, posting
//   block and creation date; dimension for receivables and sales.
// Example: Receivables per customer country; blocked customers.
// TODO-VERIFY[M] FI-030: I_Customer elements CustomerName, CustomerAccountGroup, Country, CityName, PostalCode, AuthorizationGroup, PostingIsBlocked
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Customer'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZFIV_I_Customer
  as select from I_Customer
{
      @ObjectModel.text.element: [ 'CustomerName' ]
  key Customer,
      @Semantics.text: true
      CustomerName,
      CustomerAccountGroup,
      Country,
      CityName,
      PostalCode,
      AuthorizationGroup,
      PostingIsBlocked,
      CreationDate
}
