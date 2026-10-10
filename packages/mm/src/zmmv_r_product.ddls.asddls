// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Material master cube: number of products per type, group and status.
// Example: Number of spare-part materials per product group; materials flagged for deletion.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Product - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_R_Product
  as select from ZMMV_I_Product
  association [1..1] to ZMMV_I_Product as _Product on $projection.Product = _Product.Product
{
      @ObjectModel.foreignKey.association: '_Product'
  key Product,
      ProductType,
      ProductGroup,
      BaseUnit,
      Division,
      CrossPlantStatus,
      IsMarkedForDeletion,
      AuthorizationGroup,
      CreationDate,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Products'
      cast( 1 as abap.int4 ) as NumberOfProducts,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number Flagged for Deletion'
      cast( case when IsMarkedForDeletion = 'X' then 1 else 0 end as abap.int4 ) as NumberOfDeletionFlagged,

      /* Associations */
      _Product
}
