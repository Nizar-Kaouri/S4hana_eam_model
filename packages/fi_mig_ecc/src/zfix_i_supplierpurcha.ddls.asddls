// ModuPorter FI migration | Release 1.0.0
// Purpose: Read SupplierPurcha as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierPurcha'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierPurcha
  as select from ZFIX_B_SupplierPurchaData as src
{
  key src.Supplier as Supplier,
  key src.PurchasingOrganization as PurchasingOrganization,
      src.OrderCurrency as OrderCurrency,
      src.PaymentTerms as PaymentTerms,
      src.DeletionFlag as DeletionFlag
}
