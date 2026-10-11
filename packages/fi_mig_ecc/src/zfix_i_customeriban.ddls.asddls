// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_147N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerIBAN'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_CustomerIBAN
  as select from ZFIX_B_CustomerIBANData as ib
    inner join ZFIX_I_CustomerBank as bk on ib.BankCountry = bk.BankCountry and ib.Bank = bk.Bank and ib.BankAccount = bk.BankAccount and ib.BankControlKey = bk.BankControlKey
{
  key bk.Customer as Customer,
  key ib.BankCountry as BankCountry,
  key ib.Bank as Bank,
  key ib.BankAccount as BankAccount,
  key ib.BankControlKey as BankControlKey,
      ib.IBAN as IBAN
}
