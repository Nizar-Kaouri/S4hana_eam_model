// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Assignment of a BOM to a material, plant and BOM usage (production, engineering, maintenance) with
//   the alternative (variant).
// Example: Which production BOM alternatives exist per material and plant.
// TODO-VERIFY[H] PP-020: SAP released view is I_MaterialBOMLink with keys Material, Plant, BillOfMaterialVariantUsage, BillOfMaterialVariant
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Material BOM Assignment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BillOfMaterialVariant'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZPPV_B_MaterialBOMLink
  as select from I_MaterialBOMLink
{
  key Material,
  key Plant,
  key BillOfMaterialVariantUsage,
  key BillOfMaterialVariant,
      BillOfMaterial,
      BillOfMaterialCategory
}
