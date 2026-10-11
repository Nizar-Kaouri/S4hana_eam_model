// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Project cost cube enriched with WBS element and project master data (external numbers, responsible
//   cost center, project profile and status).
// Example: Actual cost per project profile and responsible cost center.
// LINK VIEW (ships only when modules "project" AND "project_cost" AND "wbs_element" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Project Cost with Project Master'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZPSV_I_ProjectCostWithMaster
  as select from ZPSV_I_ProjectCost
  association [0..1] to ZPSV_B_WBSElement as _WBSElement on $projection.WBSElementInternalID = _WBSElement.WBSElementInternalID
  association [0..1] to ZPSV_B_Project as _Project on $projection.ProjectInternalID = _Project.ProjectInternalID
{
  key SourceLedger,
  key CompanyCode,
  key FiscalYear,
  key AccountingDocument,
  key LedgerGLLineItem,
  key Ledger,
      @ObjectModel.foreignKey.association: '_WBSElement'
      WBSElementInternalID,
      @ObjectModel.foreignKey.association: '_Project'
      ProjectInternalID,
      FiscalPeriod,
      GLAccount,
      IsSettlementPosting,
      CompanyCodeCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      ActualCostAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      SettlementAmount,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      AmountInCompanyCodeCurrency,

      /* Attributes via associations (path expressions) */
      _WBSElement.WBSElement,
      _WBSElement.ResponsibleCostCenter,
      _WBSElement.WBSElementIsBillingElement,
      _Project.Project,
      _Project.ProjectProfileCode,
      _Project.ProcessingStatus,

      /* Associations */
      _WBSElement,
      _Project
}
