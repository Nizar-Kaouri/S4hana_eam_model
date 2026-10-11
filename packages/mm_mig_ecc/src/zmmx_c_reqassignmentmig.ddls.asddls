// ModuPorter MM migration | Release 1.0.0
// Purpose: Read ReqAssignmentMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V016C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ReqAssignmentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_ReqAssignmentMig
  as select from ZMMX_I_ReqAssignment as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
  key src.PurchaseRequisitionItem as PurchaseRequisitionItem,
  key src.AccountAssignmentNumber as AccountAssignmentNumber,
      src.CostCenter as CostCenter,
      src.OrderID as OrderID,
      src.GLAccount as GLAccount,
      src.WBSElementInternalID as WBSElementInternalID
}
