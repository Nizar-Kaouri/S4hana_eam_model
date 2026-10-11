// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_76N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'CustomerBankMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_CustomerBankMig
  as select from ZFIX_I_CustomerBank as src
{
  key src.Customer as Customer,
  key src.BankCountry as BankCountry,
  key src.Bank as Bank,
  key src.BankAccount as BankAccount,
      src.BankControlKey as BankControlKey,
      src.PartnerBankType as PartnerBankType,
      src.AccountHolder as AccountHolder
}
