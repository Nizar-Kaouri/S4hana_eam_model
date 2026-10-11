// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_121N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'SupplierFaxMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierFaxMig
  as select from ZFIX_I_SupplierFax as src
{
  key src.Supplier as Supplier,
  key src.AddressNumber as AddressNumber,
  key src.PersonNumber as PersonNumber,
  key src.CommunicationValidFrom as CommunicationValidFrom,
  key src.CommunicationCounter as CommunicationCounter,
      src.FaxNumber as FaxNumber,
      src.FaxExtension as FaxExtension,
      src.IsDefaultCommunication as IsDefaultCommunication
}
