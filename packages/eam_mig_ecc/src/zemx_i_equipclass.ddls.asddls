// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_190N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EquipClass'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipClass
  as select from ZEMX_I_ClassAssignment as cl
    inner join ZEMX_I_Equipment as obj on obj.Equipment = cl.ClassifiedObject
{
  key obj.Equipment as Equipment,
  key cl.ClassType as ClassType,
  key cl.Class as Class,
      cl.ClassificationStatus as ClassificationStatus
}
where cl.ClassType = '002' and obj.IsMarkedForDeletion = ''
