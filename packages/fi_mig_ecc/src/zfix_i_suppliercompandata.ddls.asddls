// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SupplierCompanData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FIX-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierCompanData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_SupplierCompanData
  as select from lfb1 as src
{
  key src.lifnr as Supplier,
  key src.bukrs as CompanyCode,
      src.akont as ReconciliationAccount,
      src.zterm as PaymentTerms,
      src.zwels as PaymentMethods,
      src.loevm as DeletionFlag
}
