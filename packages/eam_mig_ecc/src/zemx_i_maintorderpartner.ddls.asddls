// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_176N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaintOrderPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintOrderPartner
  as select from ZEMX_B_ObjectPartner as pa
    inner join ZEMX_I_MaintOrder as obj on pa.ObjectNumber = obj.ObjectNumber
{
  key obj.MaintenanceOrder as MaintenanceOrder,
  key pa.PartnerFunction as PartnerFunction,
  key pa.PartnerCounter as PartnerCounter,
      pa.Partner as Partner
}
where pa.IsMarkedForDeletion = '' and obj.IsTechnicallyCompleted = '' and obj.IsClosed = '' and obj.IsMarkedForDeletion = ''
