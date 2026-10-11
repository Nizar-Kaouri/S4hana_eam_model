// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_84N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierBank'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierBank
  as select from ZFIX_B_SupplierBankData as ch
    inner join ZFIX_I_Supplier as obj on ch.Supplier = obj.Supplier
{
  key ch.Supplier as Supplier,
  key ch.BankCountry as BankCountry,
  key ch.Bank as Bank,
  key ch.BankAccount as BankAccount,
      ch.BankControlKey as BankControlKey,
      ch.PartnerBankType as PartnerBankType,
      ch.AccountHolder as AccountHolder
}
