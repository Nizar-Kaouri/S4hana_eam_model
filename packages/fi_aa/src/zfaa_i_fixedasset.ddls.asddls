// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per fixed asset (asset main number + subnumber) with asset class, description,
//   capitalization / deactivation date and organizational assignment (cost center, plant, profit center);
//   analytical dimension for every cube that references an asset.
// Example: Asset register per company code and asset class; asset attributes next to journal values.
// Equipment links (EAM) are not modeled here; they need a cross-product bridge (see PRODUCT_CHECKLIST.md).
// TODO-VERIFY[M] FA-001: I_FixedAsset exists, is released (C1) and its keys are CompanyCode, MasterFixedAsset, FixedAsset
// TODO-VERIFY[M] FA-002: elements AssetClass, FixedAssetDescription, AssetAdditionalDescription, InventoryNumber
// TODO-VERIFY[M] FA-003: date elements AssetCapitalizationDate, AssetDeactivationDate, CreationDate, CreatedByUser
// TODO-VERIFY[H] FA-004: time-dependent assignments (ANLZ: CostCenter, Plant, AssetLocation, ProfitCenter, Segment, BusinessArea) are direct elements of I_FixedAsset with today's values
// TODO-VERIFY[M] FA-005: I_AssetClass exists (key AssetClass) and is released
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Fixed Asset'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FixedAsset'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZFAA_I_FixedAsset
  as select from I_FixedAsset
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
  association [0..1] to I_AssetClass  as _AssetClass  on $projection.AssetClass = _AssetClass.AssetClass
  association [0..1] to I_Plant       as _Plant       on $projection.Plant = _Plant.Plant
{
      @ObjectModel.foreignKey.association: '_CompanyCode'
  key CompanyCode,
  key MasterFixedAsset,
      @ObjectModel.text.element: [ 'FixedAssetDescription' ]
  key FixedAsset,
      @Semantics.text: true
      FixedAssetDescription,
      AssetAdditionalDescription,
      @ObjectModel.foreignKey.association: '_AssetClass'
      AssetClass,
      InventoryNumber,
      AssetCapitalizationDate,
      AssetDeactivationDate,
      cast( case when AssetDeactivationDate = '00000000' then 'X' else ' ' end as abap_boolean ) as FixedAssetIsActive,
      CostCenter,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      AssetLocation,
      ProfitCenter,
      Segment,
      BusinessArea,
      CreationDate,
      CreatedByUser,

      /* Associations */
      _CompanyCode,
      _AssetClass,
      _Plant
}
