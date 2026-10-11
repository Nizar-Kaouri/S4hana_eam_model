// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_50N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_ProjectStatus
  as select from ZPSX_B_ProjectStatusData as st
    inner join ZPSX_I_Project as obj on obj.ObjectNumber = st.ObjectNumber
{
key obj.ProjectInternalID as ProjectInternalID,
  key st.StatusCode as StatusCode,
      st.ObjectNumber as ObjectNumber,
      substring( st.StatusCode, 1, 1 ) as StatusKind,
      st.StatusChangeNumber as StatusChangeNumber
}
where st.StatusIsInactive = ''
