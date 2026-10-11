// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_113N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierEmailData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_SupplierEmailData
  as select from adr6 as src
{
  key src.addrnumber as AddressNumber,
  key src.persnumber as PersonNumber,
  key src.date_from as CommunicationValidFrom,
  key src.consnumber as CommunicationCounter,
      src.smtp_addr as EmailAddress,
      src.flgdefault as IsDefaultCommunication
}
