// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Installed equipment with attributes and association of its functional location.
// Example: List all installed equipment with the external label of their functional location.
// LINK VIEW (ships only when modules "equipment" AND "functional_location" are selected).
// One row per current equipment that is installed at a functional location, with an
// association to the functional location.
// Authorization: equipment conditions only (inherited from ZEAM_I_Equipment). Functional
// location authorizations are applied when the consumer follows _FunctionalLocation.
// TODO-VERIFY[M] LNK-002: I_Equipment.FunctionalLocation holds the internal key that matches I_FunctionalLocation.FunctionalLocation
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment with Functional Location'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_EquipmentWithFuncLoc
  as select from ZEAM_I_Equipment
  association [1..1] to ZEAM_I_Equipment as _Equipment          on $projection.Equipment = _Equipment.Equipment
  association [0..1] to ZEAM_I_FuncLoc   as _FunctionalLocation on $projection.FunctionalLocation = _FunctionalLocation.FunctionalLocation
{
      @ObjectModel.foreignKey.association: '_Equipment'
  key Equipment,
      @ObjectModel.foreignKey.association: '_FunctionalLocation'
      FunctionalLocation,
      EquipInstallationPositionNmbr,
      EquipmentCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      CompanyCode,
      BusinessArea,
      CostCenter,

      /* Attributes of the installation location (path expressions) */
      _FunctionalLocation.FunctionalLocationLabelName,
      _FunctionalLocation.FunctionalLocationCategory,
      _FunctionalLocation.SuperiorFunctionalLocation,

      /* Associations */
      _Equipment,
      _FunctionalLocation
}
where
  FunctionalLocation <> ''
