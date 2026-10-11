// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment active statuses linked to an existing non-deleted current equipment master.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_EQSTAT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment active statuses'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipStatus
  as select from ZEMX_I_ObjectStatus as st
    inner join ZEMX_I_Equipment as eq on eq.ObjectNumber = st.ObjectNumber
{
      @EndUserText.label: 'Equipment'
  key eq.Equipment as Equipment,
      @EndUserText.label: 'Status Code'
  key st.StatusCode as StatusCode,
      @EndUserText.label: 'Status Kind'
      st.StatusKind as StatusKind,
      @EndUserText.label: 'Status Profile'
      st.StatusProfile as StatusProfile,
      @EndUserText.label: 'Status Change Number'
      st.StatusChangeNumber as StatusChangeNumber
}
where eq.IsMarkedForDeletion = ''
