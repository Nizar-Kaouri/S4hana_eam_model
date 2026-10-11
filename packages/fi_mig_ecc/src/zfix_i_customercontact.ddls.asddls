// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_99N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerContact'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_CustomerContact
  as select from ZFIX_B_CustomerContactData as ch
    inner join ZFIX_I_Customer as obj on ch.Customer = obj.Customer
{
  key ch.ContactPerson as ContactPerson,
      ch.Customer as Customer,
      ch.FirstName as FirstName,
      ch.LastName as LastName,
      ch.Department as Department,
      ch.Function as Function,
      ch.Telephone as Telephone,
      ch.PersonNumber as PersonNumber
}
