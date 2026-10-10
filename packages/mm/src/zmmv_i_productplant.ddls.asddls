// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Plant-specific material data: MRP type, MRP controller, procurement type, purchasing group and profit
//   center.
// Example: Which spare parts are MRP-planned in a plant; external vs. in-house procurement per plant.
// TODO-VERIFY[H] MM-004: SAP released view for plant data is I_ProductPlantBasic (name not confirmed)
// TODO-VERIFY[M] MM-005: elements MRPType, MRPResponsible, ProcurementType, PurchasingGroup, ProfitCenter, IsMarkedForDeletion
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Product Plant Data'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Plant'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZMMV_I_ProductPlant
  as select from I_ProductPlantBasic
  association [1..1] to ZMMV_I_Product as _Product on $projection.Product = _Product.Product
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
      @ObjectModel.foreignKey.association: '_Product'
  key Product,
      @ObjectModel.foreignKey.association: '_Plant'
  key Plant,
      MRPType,
      MRPResponsible,
      ProcurementType,
      PurchasingGroup,
      ProfitCenter,
      IsMarkedForDeletion,

      /* Associations */
      _Product,
      _Plant
}
