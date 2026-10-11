// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_59N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_ProjectPartner
  as select from ZPSX_B_ObjPartnerData as pa
    inner join ZPSX_I_Project as obj on pa.ObjectNumber = obj.ObjectNumber
{
  key obj.ProjectInternalID as ProjectInternalID,
  key pa.PartnerFunction as PartnerFunction,
  key pa.PartnerCounter as PartnerCounter,
      pa.Partner as Partner
}
where pa.PartnerDeleted = ''
