// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Project cube: number of projects per profile, status, company code and responsible cost center.
// Example: Number of released projects per profile and plant.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Project - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPSV_R_Project
  as select from ZPSV_I_Project
  association [1..1] to ZPSV_I_Project as _Project on $projection.ProjectInternalID = _Project.ProjectInternalID
{
      @ObjectModel.foreignKey.association: '_Project'
  key ProjectInternalID,
      Project,
      ProjectProfileCode,
      ProcessingStatus,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      ControllingArea,
      ProfitCenter,
      ResponsibleCostCenter,
      Plant,
      ProjectStartDate,
      ProjectEndDate,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Projects'
      cast( 1 as abap.int4 ) as NumberOfProjects,

      /* Associations */
      _CompanyCode,
      _Project
}
