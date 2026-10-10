// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RequisitionCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMT-015: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RequisitionCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZMMT_I_RequisitionCompare
  as select from I_PurchaseRequisitionItemAPI01 as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
  key src.PurchaseRequisitionItem as PurchaseRequisitionItem,
      src.Material as Material,
      src.Plant as Plant
}
