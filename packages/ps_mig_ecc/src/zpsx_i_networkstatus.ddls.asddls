// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_56N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_NetworkStatus
  as select from ZPSX_B_NetworkStatusData as st
    inner join ZPSX_I_NetworkHeader as obj on obj.ObjectNumber = st.ObjectNumber
    association [0..1] to ZPSX_B_StatusProfileData as _Profile
      on $projection.ObjectNumber = _Profile.ObjectNumber
{
key obj.Network as Network,
  key st.StatusCode as StatusCode,
      st.ObjectNumber as ObjectNumber,
      substring( st.StatusCode, 1, 1 ) as StatusKind,
      st.StatusChangeNumber as StatusChangeNumber,
      _Profile.StatusProfile as StatusProfile
}
where st.StatusIsInactive = ''
