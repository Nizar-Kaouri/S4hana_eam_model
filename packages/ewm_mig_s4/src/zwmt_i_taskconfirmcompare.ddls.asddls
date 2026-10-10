// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Confirmed task records only; open tasks, serials and quantity semantics remain pending. Reference extraction, not task recreation.
// Purpose: Read TaskConfirmCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskConfirmCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_TaskConfirmCompare
  as select from /scwm/ordim_c as src
{
  key src.lgnum as Warehouse,
  key src.tanum as WarehouseTask,
  key src.tapos as WarehouseTaskItem,
      src.who as WarehouseOrder,
      src.procty as ProcessType,
      src.tostat as TaskStatus,
      src.confirmed_by as ConfirmedBy,
      src.confirmed_at as ConfirmedAt,
      src.vltyp as SourceStorageType,
      src.vlpla as SourceBin,
      src.nltyp as TargetStorageType,
      src.nlpla as TargetBin
}
