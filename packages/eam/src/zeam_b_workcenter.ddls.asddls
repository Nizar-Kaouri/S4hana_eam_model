// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per work center of type 'A' (production resources / maintenance work centers)
//   with external ID, plant, category, person responsible and validity; dimension for operation and
//   backlog analyses (which reference WorkCenterInternalID).
// Example: Remaining backlog hours per work center with the work center description.
// TODO-VERIFY[M] WC-001: I_WorkCenter exists, is released (C1) with keys WorkCenterInternalID + WorkCenterTypeCode
// TODO-VERIFY[M] WC-002: elements WorkCenter, Plant, WorkCenterCategoryCode, WorkCenterResponsible, ValidityStartDate, ValidityEndDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Work Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #M,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_WorkCenter
  as select from I_WorkCenter
  association [0..*] to ZEAM_B_WorkCenterText as _Text  on $projection.WorkCenterInternalID = _Text.WorkCenterInternalID
  association [0..1] to I_Plant               as _Plant on $projection.Plant = _Plant.Plant
{
      @ObjectModel.text.association: '_Text'
  key WorkCenterInternalID,
      WorkCenterTypeCode,
      WorkCenter,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      WorkCenterCategoryCode,
      WorkCenterResponsible,
      ValidityStartDate,
      ValidityEndDate,

      /* Associations */
      _Text,
      _Plant
}
where
  WorkCenterTypeCode = 'A'
