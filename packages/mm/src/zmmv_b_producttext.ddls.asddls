// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Language-dependent product (material) description; text provider for ZMMV_B_Product.
// Example: Show material descriptions in the logon language in stock and purchasing reports.
// TODO-VERIFY[M] MM-T01: I_ProductDescription exists, is released and has elements Product, Language, ProductDescription
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Product - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Product'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZMMV_B_ProductText
  as select from I_ProductDescription
{
  key Product,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      ProductDescription
}
