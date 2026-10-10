// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: All native warehouse-order records; customer must approve process state and cutover scope.
// Purpose: Read WarehouseOrderCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseOrderCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WarehouseOrderCompare
  as select from /scwm/who as src
{
  key src.lgnum as Warehouse,
  key src.who as WarehouseOrder,
      src.wcr as CreationRule,
      src.status as OrderStatus,
      src.queue as Queue,
      src.areawho as ActivityArea,
      src.created_at as CreatedAt,
      src.created_by as CreatedBy,
      src.started_at as StartedAt,
      src.confirmed_at as ConfirmedAt
}
