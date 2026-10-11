// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work center cube with the number of maintenance work centers per plant and category.
// Example: Organizational overview of maintenance work centers per plant.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Work Center - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #M,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_WorkCenter
  as select from ZEAM_B_WorkCenter
  association [1..1] to ZEAM_B_WorkCenter as _WorkCenter on $projection.WorkCenterInternalID = _WorkCenter.WorkCenterInternalID
{
      @ObjectModel.foreignKey.association: '_WorkCenter'
  key WorkCenterInternalID,
      WorkCenterTypeCode,
      WorkCenter,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      WorkCenterCategoryCode,
      WorkCenterResponsible,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Work Centers'
      cast( 1 as abap.int4 ) as NumberOfWorkCenters,

      /* Associations */
      _Plant,
      _WorkCenter
}
