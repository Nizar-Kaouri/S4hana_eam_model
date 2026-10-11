// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance plan with a to-many association to the orders it generated.
// Example: Preventive maintenance compliance: orders per plan and their completion status.
// LINK VIEW (ships only when modules "maintenance_plan" AND "maintenance_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance Plan with Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintPlanWithOrder
  as select from ZEAM_B_MaintPlan
  association [0..*] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.MaintenancePlan = _MaintenanceOrder.MaintenancePlan
{
  key MaintenancePlan,
      MaintenancePlanDesc,
      MaintenancePlanCategory,
      MaintenanceStrategy,
      MaintenancePlanIsInactive,
      AuthorizationGroup,

      /* Associations */
      _MaintenanceOrder
}
