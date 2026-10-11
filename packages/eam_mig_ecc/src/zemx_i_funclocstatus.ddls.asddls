// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_178N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLocStatus
  as select from ZEMX_I_ObjectStatus as st
    inner join ZEMX_I_FuncLoc as obj on obj.ObjectNumber = st.ObjectNumber
{
  key obj.FunctionalLocation as FunctionalLocation,
  key st.StatusCode as StatusCode,
      st.StatusKind as StatusKind,
      st.StatusProfile as StatusProfile,
      st.StatusChangeNumber as StatusChangeNumber
}
where obj.IsMarkedForDeletion = ''
