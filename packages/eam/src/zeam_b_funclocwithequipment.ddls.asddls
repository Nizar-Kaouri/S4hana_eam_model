// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location with a to-many association to the equipment installed at it.
// Example: From a functional location navigate to all currently installed equipment (e.g. in an object page).
// LINK VIEW (ships only when modules "equipment" AND "functional_location" are selected).
// One row per functional location, with a to-many association to the equipment
// currently installed at it.
// TODO-VERIFY[L] LNK-001: to-many association target filtered by the equipment's FunctionalLocation element (no installation-date logic)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional Location with Equipment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_FuncLocWithEquipment
  as select from ZEAM_B_FuncLoc
  association [1..1] to ZEAM_B_FuncLoc   as _FunctionalLocation on $projection.FunctionalLocation = _FunctionalLocation.FunctionalLocation
  association [0..*] to ZEAM_B_Equipment as _InstalledEquipment on $projection.FunctionalLocation = _InstalledEquipment.FunctionalLocation
{
      @ObjectModel.foreignKey.association: '_FunctionalLocation'
  key FunctionalLocation,
      FunctionalLocationLabelName,
      FunctionalLocationCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      CompanyCode,
      BusinessArea,
      CostCenter,

      /* Associations */
      _FunctionalLocation,
      _InstalledEquipment
}
