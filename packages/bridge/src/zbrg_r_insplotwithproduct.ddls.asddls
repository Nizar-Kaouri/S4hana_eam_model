// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Inspection lot cube enriched with product type and group from the MM product.
// Example: Rejection rate per product group and plant.
// LINK VIEW (ships only when modules "mm:product" AND "qm:inspection_lot" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Inspection Lot with Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZBRG_R_InspLotWithProduct
  as select from ZQMV_R_InspectionLot
  association [0..1] to ZMMV_I_Product as _Product on $projection.Material = _Product.Product
{
  key InspectionLot,
      @ObjectModel.foreignKey.association: '_Product'
      Material,
      Plant,
      Supplier,
      InspectionLotOrigin,
      InspLotHasUsageDecision,
      InspLotIsRejected,
      InspLotCreationYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      NumberOfInspectionLots,
      @Aggregation.default: #SUM
      NumberOfLotsWithDecision,
      @Aggregation.default: #SUM
      NumberOfRejectedLots,

      /* Attributes via associations (path expressions) */
      _Product.ProductType,
      _Product.ProductGroup,

      /* Associations */
      _Product
}
