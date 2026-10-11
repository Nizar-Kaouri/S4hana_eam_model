// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance order actual cost cube: Universal Journal amounts (company code and global
//   currency) joined with maintenance order attributes (order type, activity type, planning plant,
//   reference objects, open flag).
// Example: Actual maintenance cost per plant and activity type (preventive vs. corrective) per period.
// Planned costs are not included (later refinement).
// TODO-VERIFY[M] RPT-C05: inner join of two Z view entities in a #CUBE; element BusinessArea taken from the journal entry
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order Cost - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #XXL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_MaintOrderCost
  as select from ZEAM_B_MaintOrderActualCost as Cost
    inner join   ZEAM_B_MaintOrder           as MaintOrder on Cost.OrderID = MaintOrder.MaintenanceOrder
  association [1..1] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.MaintenanceOrder = _MaintenanceOrder.MaintenanceOrder
{
  key Cost.SourceLedger,
  key Cost.CompanyCode,
  key Cost.FiscalYear,
  key Cost.AccountingDocument,
  key Cost.LedgerGLLineItem,
  key Cost.Ledger,
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
      MaintOrder.MaintenanceOrder,
      MaintOrder.MaintenanceOrderType,
      MaintOrder.MaintenanceActivityType,
      MaintOrder.MaintPriority,
      MaintOrder.MaintOrderIsOpen,
      MaintOrder.MaintenancePlanningPlant,
      MaintOrder.MaintenancePlannerGroup,
      MaintOrder.MaintenancePlant,
      MaintOrder.MainWorkCenter,
      MaintOrder.CostCenter,
      MaintOrder.Equipment,
      MaintOrder.FunctionalLocation,
      MaintOrder.MaintenancePlan,
      Cost.FiscalPeriod,
      Cost.PostingDate,
      Cost.GLAccount,
      Cost.BusinessTransactionType,
      Cost.ControllingArea,
      Cost.ProfitCenter,
      Cost.BusinessArea,
      Cost.CompanyCodeCurrency,
      Cost.GlobalCurrency,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      Cost.AmountInCompanyCodeCurrency,
      @Aggregation.default: #SUM
      @Semantics.amount.currencyCode: 'GlobalCurrency'
      Cost.AmountInGlobalCurrency,

      /* Associations */
      _MaintenanceOrder
}
