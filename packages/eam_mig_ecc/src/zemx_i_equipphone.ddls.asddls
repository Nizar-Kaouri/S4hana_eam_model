// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_202N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EquipPhone'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipPhone
  as select from ZEMX_B_EquipPhoneData as com
    inner join ZEMX_I_Equipment as obj on com.AddressNumber = obj.AddressNumber
{
  key obj.Equipment as Equipment,
  key com.AddressNumber as AddressNumber,
  key com.PersonNumber as PersonNumber,
  key com.CommunicationValidFrom as CommunicationValidFrom,
  key com.CommunicationCounter as CommunicationCounter,
      com.Telephone as Telephone,
      com.TelephoneExtension as TelephoneExtension,
      com.IsDefaultCommunication as IsDefaultCommunication
}
where com.PersonNumber = '' and obj.IsMarkedForDeletion = ''
