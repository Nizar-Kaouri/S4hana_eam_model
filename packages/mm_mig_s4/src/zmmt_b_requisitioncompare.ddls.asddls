// ModuPorter MM migration | Release 1.0.0
// Purpose: Read RequisitionCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RequisitionCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZMMT_B_RequisitionCompare
  as select from I_PurchaseRequisitionItemAPI01 as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
  key src.PurchaseRequisitionItem as PurchaseRequisitionItem,
      src.Material as Material,
      src.Plant as Plant
}
