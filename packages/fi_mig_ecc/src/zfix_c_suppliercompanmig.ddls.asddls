// ModuPorter FI migration | Release 1.0.0
// Purpose: Read SupplierCompanMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierCompanMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierCompanMig
  as select from ZFIX_I_SupplierCompan as src
{
  key src.Supplier as Supplier,
  key src.CompanyCode as CompanyCode,
      src.ReconciliationAccount as ReconciliationAccount,
      src.PaymentTerms as PaymentTerms,
      src.PaymentMethods as PaymentMethods,
      src.DeletionFlag as DeletionFlag,
      src.PaymentBlock as PaymentBlock,
      src.SortKey as SortKey,
      src.PlanningGroup as PlanningGroup
}
