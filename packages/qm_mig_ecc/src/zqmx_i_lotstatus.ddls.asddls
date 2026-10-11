// ModuPorter QM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZQMX_61N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LotStatus'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_LotStatus
  as select from ZQMX_B_LotStatusData as st
    inner join ZQMX_I_InspectionLot as obj on obj.ObjectNumber = st.ObjectNumber
    association [0..1] to ZQMX_B_StatusProfileData as _Profile
      on $projection.ObjectNumber = _Profile.ObjectNumber
{
key obj.InspectionLot as InspectionLot,
  key st.StatusCode as StatusCode,
      st.ObjectNumber as ObjectNumber,
      substring( st.StatusCode, 1, 1 ) as StatusKind,
      st.StatusChangeNumber as StatusChangeNumber,
      _Profile.StatusProfile as StatusProfile
}
where st.StatusIsInactive = ''
