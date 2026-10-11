// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_236N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ObjectPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_ObjectPartner
  as select from ZEMX_B_ObjectPartner as src
{
  key src.PartnerObjectKey as PartnerObjectKey,
  key src.PartnerFunction as PartnerFunction,
  key src.PartnerCounter as PartnerCounter,
  key src.PartnerObjectType as PartnerObjectType,
      src.Partner as Partner,
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
