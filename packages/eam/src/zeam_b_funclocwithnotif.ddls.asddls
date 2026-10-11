// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location with a to-many association to the maintenance notifications that reference it.
// Example: Notification history of a functional location (e.g. a production line).
// LINK VIEW (ships only when modules "functional_location" AND "maintenance_notification" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional Location with Notifications'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_FuncLocWithNotif
  as select from ZEAM_B_FuncLoc
  association [0..*] to ZEAM_B_MaintNotif as _MaintenanceNotification on $projection.FunctionalLocation = _MaintenanceNotification.FunctionalLocation
{
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
      _MaintenanceNotification
}
