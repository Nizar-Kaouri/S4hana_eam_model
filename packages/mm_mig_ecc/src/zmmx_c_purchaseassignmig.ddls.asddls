// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseAssignMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V020C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseAssignMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_PurchaseAssignMig
  as select from ZMMX_I_PurchaseAssign as src
{
  key src.PurchaseOrder as PurchaseOrder,
  key src.PurchaseOrderItem as PurchaseOrderItem,
  key src.AccountAssignmentNumber as AccountAssignmentNumber,
      src.CostCenter as CostCenter,
      src.OrderID as OrderID,
      src.GLAccount as GLAccount,
      src.WBSElementInternalID as WBSElementInternalID
}
