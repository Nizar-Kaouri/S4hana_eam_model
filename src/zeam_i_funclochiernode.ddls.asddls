// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Parent-child source for the functional location hierarchy: each functional location with its
//   superior location and the self-association _SuperiorNode used by ZEAM_I_FuncLocHier.
// Example: Source of the hierarchy; can also be used for one-level parent lookups.
// Module functional_location_hierarchy has a hard dependency on functional_location.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Functional Location Hierarchy Node'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_FuncLocHierNode
  as select from ZEAM_I_FuncLoc
  association [0..1] to ZEAM_I_FuncLocHierNode as _SuperiorNode on $projection.SuperiorFunctionalLocation = _SuperiorNode.FunctionalLocation
{
  key FunctionalLocation,
      SuperiorFunctionalLocation,
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
      _SuperiorNode
}
