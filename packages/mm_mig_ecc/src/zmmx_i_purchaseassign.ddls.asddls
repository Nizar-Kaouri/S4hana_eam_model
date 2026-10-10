// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseAssign as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V020R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseAssign'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_PurchaseAssign
  as select from ZMMX_I_PurchaseAssignData as src
{
  key src.PurchaseOrder as PurchaseOrder,
  key src.PurchaseOrderItem as PurchaseOrderItem,
  key src.AccountAssignmentNumber as AccountAssignmentNumber,
      src.CostCenter as CostCenter,
      src.OrderID as OrderID,
      src.GLAccount as GLAccount,
      src.WBSElementInternalID as WBSElementInternalID
}
