// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment assigned to a fixed asset, with the asset's class, capitalization date and active flag and
//   an association to the asset master.
// Example: Which equipment belongs to which asset; equipment whose asset is already deactivated.
// LINK VIEW (ships only when modules "eam:equipment" AND "fi_aa:fixed_asset" are selected).
// TODO-VERIFY[M] BRG-001: equipment asset assignment (EQUZ/ILOA ANLNR, ANLUN) matches I_FixedAsset keys together with the equipment company code
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment with Fixed Asset'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZBRG_B_EquipmentWithAsset
  as select from ZEAM_B_Equipment
  association [0..1] to ZFAA_B_FixedAsset as _FixedAsset on $projection.CompanyCode = _FixedAsset.CompanyCode
    and $projection.MasterFixedAsset = _FixedAsset.MasterFixedAsset
    and $projection.FixedAsset = _FixedAsset.FixedAsset
{
  key Equipment,
      CompanyCode,
      MasterFixedAsset,
      @ObjectModel.foreignKey.association: '_FixedAsset'
      FixedAsset,
      EquipmentCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      BusinessArea,
      CostCenter,

      /* Attributes via associations (path expressions) */
      _FixedAsset.AssetClass,
      _FixedAsset.AssetCapitalizationDate,
      _FixedAsset.FixedAssetIsActive,

      /* Associations */
      _FixedAsset
}
where
  MasterFixedAsset <> ''
