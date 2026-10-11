// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Project with a to-many association to its WBS elements.
// Example: Project structure in a project object page.
// LINK VIEW (ships only when modules "project" AND "wbs_element" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Project with WBS Elements'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ProjectInternalID'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZPSV_B_ProjectWithWBSElement
  as select from ZPSV_B_Project
  association [0..*] to ZPSV_B_WBSElement as _WBSElement on $projection.ProjectInternalID = _WBSElement.ProjectInternalID
{
  key ProjectInternalID,
      Project,
      ProjectDescription,
      CompanyCode,
      ProfitCenter,

      /* Associations */
      _WBSElement
}
