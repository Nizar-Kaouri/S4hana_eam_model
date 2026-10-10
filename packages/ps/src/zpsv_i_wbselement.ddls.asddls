// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per WBS element: external WBS number, description, project, organizational assignment,
//   planning / account assignment / billing / statistical flags and planned dates; dimension for project cost
//   cubes.
// Example: Account-assignable WBS elements of a project; WBS elements per responsible cost center.
// The project is a plain field; the project module is not a dependency (link views come later).
// TODO-VERIFY[H] PS-010: SAP released view for WBS elements is I_WBSElement with key WBSElementInternalID
// TODO-VERIFY[H] PS-011: flag elements WBSElementIsPlanningElement, WBSElementIsAccountAssignment, WBSElementIsBillingElement, WBSIsStatisticalWBSElement
// TODO-VERIFY[M] PS-012: elements WBSElement, WBSDescription, ProjectInternalID, PlannedStartDate, PlannedEndDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'WBS Element'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'WBSElementInternalID'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZPSV_I_WBSElement
  as select from I_WBSElement
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
      @ObjectModel.text.element: [ 'WBSDescription' ]
  key WBSElementInternalID,
      WBSElement,
      @Semantics.text: true
      WBSDescription,
      ProjectInternalID,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      ControllingArea,
      ProfitCenter,
      ResponsibleCostCenter,
      Plant,
      WBSElementIsPlanningElement,
      WBSElementIsAccountAssignment,
      WBSElementIsBillingElement,
      WBSIsStatisticalWBSElement,
      PlannedStartDate,
      PlannedEndDate,

      /* Associations */
      _CompanyCode
}
