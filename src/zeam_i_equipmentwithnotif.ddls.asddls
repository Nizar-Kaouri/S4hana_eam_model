// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment with a to-many association to the maintenance notifications that reference it.
// Example: From an equipment object page navigate to its notification history.
// LINK VIEW (ships only when modules "equipment" AND "maintenance_notification" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment with Notifications'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_EquipmentWithNotif
  as select from ZEAM_I_Equipment
  association [0..*] to ZEAM_I_MaintNotif as _MaintenanceNotification on $projection.Equipment = _MaintenanceNotification.Equipment
{
  key Equipment,
      EquipmentCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      CompanyCode,
      BusinessArea,
      CostCenter,

      /* Associations */
      _MaintenanceNotification
}
