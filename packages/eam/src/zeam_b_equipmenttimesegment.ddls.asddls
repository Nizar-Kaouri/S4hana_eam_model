// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: All time segments of an equipment (usage history): validity period, installation location
//   (functional location / superordinate equipment) and organizational assignment per segment.
// Example: Where was pump P-100 installed in 2025, and for how long? Installation history per functional location.
// Module equipment_history has a hard dependency on equipment (association _Equipment, text via the current view).
// Uses the same element names as ZEAM_B_Equipment (see EQ-001, EQ-010, EQ-019).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment Time Segment'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ValidityEndDate'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_EquipmentTimeSegment
  as select from I_Equipment
  association [1..1] to ZEAM_B_Equipment as _Equipment on $projection.Equipment = _Equipment.Equipment
{
      @ObjectModel.foreignKey.association: '_Equipment'
  key Equipment,
  key ValidityEndDate,
      ValidityStartDate,
      cast( case when ValidityEndDate = '99991231' then 'X' else ' ' end as abap_boolean ) as IsCurrentTimeSegment,
      FunctionalLocation,
      SuperordinateEquipment,
      EquipInstallationPositionNmbr,
      EquipmentCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      PlantSection,
      AssetLocation,
      CompanyCode,
      BusinessArea,
      ControllingArea,
      CostCenter,

      /* Associations */
      _Equipment
}
