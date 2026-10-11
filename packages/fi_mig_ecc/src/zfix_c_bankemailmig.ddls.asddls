// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_124N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'BankEmailMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_BankEmailMig
  as select from ZFIX_I_BankEmail as src
{
  key src.BankCountry as BankCountry,
  key src.BankKey as BankKey,
  key src.AddressNumber as AddressNumber,
  key src.PersonNumber as PersonNumber,
  key src.CommunicationValidFrom as CommunicationValidFrom,
  key src.CommunicationCounter as CommunicationCounter,
      src.EmailAddress as EmailAddress,
      src.IsDefaultCommunication as IsDefaultCommunication
}
