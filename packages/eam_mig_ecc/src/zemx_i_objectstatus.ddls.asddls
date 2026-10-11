// ModuPorter EAM migration | Release 1.0.0
// Purpose: Active statuses with object type, object key and status profile.
// Example: Read the active user statuses of the orders: filter StatusObjectType = 'OR' and StatusKind = 'E'.
@AbapCatalog.sqlViewName: 'ZEMX_ST'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Object status'
@ObjectModel.representativeKey: 'StatusCode'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #COMPOSITE
define view ZEMX_I_ObjectStatus
  as select from ZEMX_I_ObjectStatusEntry as st
{
      @EndUserText.label: 'Object Number'
  key st.ObjectNumber                as ObjectNumber,
      @EndUserText.label: 'Status Code'
  key st.StatusCode                  as StatusCode,
      @EndUserText.label: 'Status Object Type'
      st.StatusObjectType            as StatusObjectType,
      @EndUserText.label: 'Status Object Key'
      st.StatusObjectKey             as StatusObjectKey,
      @EndUserText.label: 'Status Kind'
      st.StatusKind                  as StatusKind,
      @EndUserText.label: 'Status Profile'
      st._StatusObject.StatusProfile as StatusProfile,
      @EndUserText.label: 'Status Change Number'
      st.StatusChangeNumber          as StatusChangeNumber
}
