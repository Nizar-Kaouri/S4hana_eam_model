// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key st.ObjectNumber                as ObjectNumber,
  key st.StatusCode                  as StatusCode,
      st.StatusObjectType            as StatusObjectType,
      st.StatusObjectKey             as StatusObjectKey,
      st.StatusKind                  as StatusKind,
      st._StatusObject.StatusProfile as StatusProfile,
      st.StatusChangeNumber          as StatusChangeNumber
}
