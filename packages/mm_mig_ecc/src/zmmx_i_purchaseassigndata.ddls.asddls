// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseAssignData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-020: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V020'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseAssignData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_PurchaseAssignData
  as select from ekkn as src
{
  key src.ebeln as PurchaseOrder,
  key src.ebelp as PurchaseOrderItem,
  key src.zekkn as AccountAssignmentNumber,
      src.kostl as CostCenter,
      src.aufnr as OrderID,
      src.sakto as GLAccount,
      src.ps_psp_pnr as WBSElementInternalID
}
