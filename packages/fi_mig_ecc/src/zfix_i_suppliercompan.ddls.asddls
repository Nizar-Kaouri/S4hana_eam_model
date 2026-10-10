// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SupplierCompan as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierCompan'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierCompan
  as select from ZFIX_I_SupplierCompanData as src
{
  key src.Supplier as Supplier,
  key src.CompanyCode as CompanyCode,
      src.ReconciliationAccount as ReconciliationAccount,
      src.PaymentTerms as PaymentTerms,
      src.PaymentMethods as PaymentMethods,
      src.DeletionFlag as DeletionFlag
}
