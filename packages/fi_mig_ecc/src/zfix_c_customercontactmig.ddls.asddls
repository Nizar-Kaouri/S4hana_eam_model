// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_100N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'CustomerContactMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_CustomerContactMig
  as select from ZFIX_I_CustomerContact as src
{
  key src.ContactPerson as ContactPerson,
      src.Customer as Customer,
      src.FirstName as FirstName,
      src.LastName as LastName,
      src.Department as Department,
      src.Function as Function,
      src.Telephone as Telephone,
      src.PersonNumber as PersonNumber
}
