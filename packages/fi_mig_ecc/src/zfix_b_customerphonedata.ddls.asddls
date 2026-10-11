// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_107N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerPhoneData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_CustomerPhoneData
  as select from adr2 as src
{
  key src.addrnumber as AddressNumber,
  key src.persnumber as PersonNumber,
  key src.date_from as CommunicationValidFrom,
  key src.consnumber as CommunicationCounter,
      src.tel_number as Telephone,
      src.tel_extens as TelephoneExtension,
      src.flgdefault as IsDefaultCommunication
}
