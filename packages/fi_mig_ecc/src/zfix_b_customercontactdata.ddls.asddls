// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_98N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerContactData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_CustomerContactData
  as select from knvk as src
{
  key src.parnr as ContactPerson,
      src.kunnr as Customer,
      src.namev as FirstName,
      src.name1 as LastName,
      src.abtnr as Department,
      src.pafkt as Function,
      src.telf1 as Telephone,
      src.prsnr as PersonNumber
}
