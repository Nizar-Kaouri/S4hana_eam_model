// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: All native warehouse-order records; customer must approve process state and cutover scope.
// Purpose: Read WarehouseOrder as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V011R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseOrder'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WarehouseOrder
  as select from ZWMX_I_WarehouseOrderData as src
{
  key src.Warehouse as Warehouse,
  key src.WarehouseOrder as WarehouseOrder,
      src.CreationRule as CreationRule,
      src.OrderStatus as OrderStatus,
      src.Queue as Queue,
      src.ActivityArea as ActivityArea,
      src.CreatedAt as CreatedAt,
      src.CreatedBy as CreatedBy,
      src.StartedAt as StartedAt,
      src.ConfirmedAt as ConfirmedAt
}
