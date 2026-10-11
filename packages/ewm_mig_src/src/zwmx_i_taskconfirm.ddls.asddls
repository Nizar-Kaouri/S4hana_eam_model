// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Confirmed task records only; open tasks, serials and quantity semantics remain pending. Reference extraction, not task recreation.
// Purpose: Read TaskConfirm as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskConfirm'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_TaskConfirm
  as select from ZWMX_B_TaskConfirmData as src
{
  key src.Warehouse as Warehouse,
  key src.WarehouseTask as WarehouseTask,
  key src.WarehouseTaskItem as WarehouseTaskItem,
      src.WarehouseOrder as WarehouseOrder,
      src.ProcessType as ProcessType,
      src.TaskStatus as TaskStatus,
      src.ConfirmedBy as ConfirmedBy,
      src.ConfirmedAt as ConfirmedAt,
      src.SourceStorageType as SourceStorageType,
      src.SourceBin as SourceBin,
      src.TargetStorageType as TargetStorageType,
      src.TargetBin as TargetBin
}
