// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Product with a to-many association to its stock segments (plant, storage location, batch, stock
//   type).
// Example: Stock overview in a material object page.
// LINK VIEW (ships only when modules "product" AND "material_stock" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Product with Stock'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Product'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZMMV_B_ProductWithStock
  as select from ZMMV_B_Product
  association [0..*] to ZMMV_B_MaterialStock as _Stock on $projection.Product = _Stock.Product
{
  key Product,
      ProductType,
      ProductGroup,
      BaseUnit,
      AuthorizationGroup,

      /* Associations */
      _Stock
}
