// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_214N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocFax'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLocFax
  as select from ZEMX_B_FuncLocFaxData as com
    inner join ZEMX_I_FuncLoc as obj on com.AddressNumber = obj.AddressNumber
{
  key obj.FunctionalLocation as FunctionalLocation,
  key com.AddressNumber as AddressNumber,
  key com.PersonNumber as PersonNumber,
  key com.CommunicationValidFrom as CommunicationValidFrom,
  key com.CommunicationCounter as CommunicationCounter,
      com.FaxNumber as FaxNumber,
      com.FaxExtension as FaxExtension,
      com.IsDefaultCommunication as IsDefaultCommunication
}
where com.PersonNumber = '' and obj.IsMarkedForDeletion = ''
