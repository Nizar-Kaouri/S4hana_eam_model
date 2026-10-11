// ModuPorter CO migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZCOX_47N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_OrderStatus
  as select from ZCOX_B_OrderStatusData as st
    inner join ZCOX_I_InternalOrder as obj on obj.ObjectNumber = st.ObjectNumber
    association [0..1] to ZCOX_B_StatusProfileData as _Profile
      on $projection.ObjectNumber = _Profile.ObjectNumber
{
key obj.InternalOrder as InternalOrder,
  key st.StatusCode as StatusCode,
      st.ObjectNumber as ObjectNumber,
      substring( st.StatusCode, 1, 1 ) as StatusKind,
      st.StatusChangeNumber as StatusChangeNumber,
      _Profile.StatusProfile as StatusProfile
}
where st.StatusIsInactive = ''
