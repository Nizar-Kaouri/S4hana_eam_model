// ModuPorter QM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZQMX_64N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_NotifStatus
  as select from ZQMX_B_NotifStatusData as st
    inner join ZQMX_I_QualityNotific as obj on obj.ObjectNumber = st.ObjectNumber
{
key obj.QualityNotification as QualityNotification,
  key st.StatusCode as StatusCode,
      st.ObjectNumber as ObjectNumber,
      substring( st.StatusCode, 1, 1 ) as StatusKind,
      st.StatusChangeNumber as StatusChangeNumber
}
where st.StatusIsInactive = ''
