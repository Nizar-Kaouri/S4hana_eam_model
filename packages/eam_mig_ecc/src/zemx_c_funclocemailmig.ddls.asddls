// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_209N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'FuncLocEmailMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocEmailMig
  as select from ZEMX_I_FuncLocEmail as src
{
  key src.FunctionalLocation as FunctionalLocation,
  key src.AddressNumber as AddressNumber,
  key src.PersonNumber as PersonNumber,
  key src.CommunicationValidFrom as CommunicationValidFrom,
  key src.CommunicationCounter as CommunicationCounter,
      src.EmailAddress as EmailAddress,
      src.IsDefaultCommunication as IsDefaultCommunication
}
