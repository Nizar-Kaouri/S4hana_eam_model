// ModuPorter MM migration | Release 1.0.0
// Purpose: Read Requisition as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V015R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Requisition'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_Requisition
  as select from ZMMX_B_RequisitionData as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
  key src.PurchaseRequisitionItem as PurchaseRequisitionItem,
      src.Material as Material,
      src.Plant as Plant,
      src.RequestedQuantity as RequestedQuantity,
      src.Unit as Unit,
      src.DeletionFlag as DeletionFlag,
      src.ClosedFlag as ClosedFlag
}
