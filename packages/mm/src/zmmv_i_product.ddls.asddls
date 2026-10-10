// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per product (material) with type, group, base unit, status, weights and authorization group;
//   analytical dimension for stock, movement and purchasing cubes.
// Example: Material attributes next to stock quantities; spare parts filtered by product type.
// TODO-VERIFY[M] MM-001: I_Product exists, is released (C1) with key Product
// TODO-VERIFY[M] MM-002: elements ProductType, ProductGroup, BaseUnit, Division, CrossPlantStatus, IsMarkedForDeletion
// TODO-VERIFY[M] MM-003: elements GrossWeight, NetWeight, WeightUnit, AuthorizationGroup, CreationDate, CreatedByUser
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Product'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZMMV_I_Product
  as select from I_Product
  association [0..*] to ZMMV_I_ProductText as _Text on $projection.Product = _Text.Product
{
      @ObjectModel.text.association: '_Text'
  key Product,
      ProductType,
      ProductGroup,
      BaseUnit,
      Division,
      CrossPlantStatus,
      IsMarkedForDeletion,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      GrossWeight,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      NetWeight,
      WeightUnit,
      AuthorizationGroup,
      CreationDate,
      CreatedByUser,

      /* Associations */
      _Text
}
