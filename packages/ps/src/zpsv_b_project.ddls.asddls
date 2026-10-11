// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per project definition: external project number, description, project profile, processing
//   status, company code, controlling area, profit center, responsible cost center, plant, currency and planned
//   dates.
// Example: Projects per profile and status; shutdown projects of a plant.
// TODO-VERIFY[H] PS-001: SAP released view for project definitions is I_EnterpriseProject and covers classic PS projects
// TODO-VERIFY[H] PS-002: key element ProjectInternalID (API uses ProjectUUID) and external number element Project
// TODO-VERIFY[M] PS-003: elements ProjectProfileCode, ProcessingStatus, ResponsibleCostCenter, ProjectCurrency, ProjectStartDate, ProjectEndDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ProjectInternalID'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZPSV_B_Project
  as select from I_EnterpriseProject
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
      @ObjectModel.text.element: [ 'ProjectDescription' ]
  key ProjectInternalID,
      Project,
      @Semantics.text: true
      ProjectDescription,
      ProjectProfileCode,
      ProcessingStatus,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      ControllingArea,
      ProfitCenter,
      ResponsibleCostCenter,
      Plant,
      ProjectCurrency,
      ProjectStartDate,
      ProjectEndDate,

      /* Associations */
      _CompanyCode
}
