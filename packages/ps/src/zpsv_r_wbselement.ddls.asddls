// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: WBS element cube: number of (account-assignable) WBS elements per project, company code and cost
//   center.
// Example: Project structure size per company code.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'WBS Element - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPSV_R_WBSElement
  as select from ZPSV_I_WBSElement
  association [1..1] to ZPSV_I_WBSElement as _WBSElement on $projection.WBSElementInternalID = _WBSElement.WBSElementInternalID
{
      @ObjectModel.foreignKey.association: '_WBSElement'
  key WBSElementInternalID,
      WBSElement,
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

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of WBS Elements'
      cast( 1 as abap.int4 ) as NumberOfWBSElements,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Account-Assignable WBS Elements'
      cast( case when WBSElementIsAccountAssignment = 'X' then 1 else 0 end as abap.int4 ) as NumberOfAcctAssignmentWBS,

      /* Associations */
      _CompanyCode,
      _WBSElement
}
