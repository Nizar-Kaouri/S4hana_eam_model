// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_126N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BankPhone'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_BankPhone
  as select from ZFIX_B_BankPhoneData as com
    inner join ZFIX_I_Bank as obj on com.AddressNumber = obj.AddressNumber
{
  key obj.BankCountry as BankCountry,
  key obj.BankKey as BankKey,
  key com.AddressNumber as AddressNumber,
  key com.PersonNumber as PersonNumber,
  key com.CommunicationValidFrom as CommunicationValidFrom,
  key com.CommunicationCounter as CommunicationCounter,
      com.Telephone as Telephone,
      com.TelephoneExtension as TelephoneExtension,
      com.IsDefaultCommunication as IsDefaultCommunication
}
where com.PersonNumber = ''
