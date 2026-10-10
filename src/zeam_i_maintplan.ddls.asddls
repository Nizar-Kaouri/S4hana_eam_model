// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance plan with description, category, strategy and creation data;
//   dimension for maintenance item and order analyses.
// Example: Strategy plans vs. single-cycle plans per category; maintenance plan as characteristic in order cubes.
// TODO-VERIFY[M] PL-001: I_MaintenancePlan exists, is released (C1) and its key element is MaintenancePlan
// TODO-VERIFY[M] PL-002: elements MaintenancePlanDesc, MaintenancePlanCategory, MaintenanceStrategy, CreationDate
// TODO-VERIFY[H] PL-003: deactivation / deletion indicator assumed MaintenancePlanIsInactive and AuthorizationGroup on the plan header
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Plan'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #M,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_MaintPlan
  as select from I_MaintenancePlan
  association [0..*] to ZEAM_I_MaintItem as _MaintenanceItem on $projection.MaintenancePlan = _MaintenanceItem.MaintenancePlan
{
      @ObjectModel.text.element: [ 'MaintenancePlanDesc' ]
  key MaintenancePlan,
      @Semantics.text: true
      MaintenancePlanDesc,
      MaintenancePlanCategory,
      MaintenanceStrategy,
      MaintenancePlanIsInactive,
      AuthorizationGroup,
      CreationDate,

      /* Associations */
      _MaintenanceItem
}
