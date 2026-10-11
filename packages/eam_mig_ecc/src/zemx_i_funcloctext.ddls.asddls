// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_171N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocText'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLocText
  as select from ZEMX_B_FuncLocDesc as txt
    inner join ZEMX_I_FuncLoc as obj on obj.FunctionalLocation = txt.FunctionalLocation
{
  key txt.FunctionalLocation as FunctionalLocation,
  key txt.Language as Language,
      txt.FunctionalLocationName as FunctionalLocationName
}
where obj.IsMarkedForDeletion = ''
