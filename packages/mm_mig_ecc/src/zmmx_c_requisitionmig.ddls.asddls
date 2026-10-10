// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read RequisitionMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V015C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RequisitionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_RequisitionMig
  as select from ZMMX_I_Requisition as src
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
