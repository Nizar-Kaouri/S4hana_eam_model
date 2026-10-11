// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_83N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierBankData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_SupplierBankData
  as select from lfbk as src
{
  key src.lifnr as Supplier,
  key src.banks as BankCountry,
  key src.bankl as Bank,
  key src.bankn as BankAccount,
      src.bkont as BankControlKey,
      src.bvtyp as PartnerBankType,
      src.koinh as AccountHolder
}
