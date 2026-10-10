// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SupplierPurchaData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FIX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierPurchaData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_SupplierPurchaData
  as select from lfm1 as src
{
  key src.lifnr as Supplier,
  key src.ekorg as PurchasingOrganization,
      src.waers as OrderCurrency,
      src.zterm as PaymentTerms,
      src.loevm as DeletionFlag
}
