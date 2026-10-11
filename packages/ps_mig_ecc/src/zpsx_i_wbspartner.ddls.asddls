// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_61N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_WBSPartner
  as select from ZPSX_B_ObjPartnerData as pa
    inner join ZPSX_I_WBS as obj on pa.ObjectNumber = obj.ObjectNumber
{
  key obj.WBSElementInternalID as WBSElementInternalID,
  key pa.PartnerFunction as PartnerFunction,
  key pa.PartnerCounter as PartnerCounter,
      pa.Partner as Partner
}
where pa.PartnerDeleted = ''
