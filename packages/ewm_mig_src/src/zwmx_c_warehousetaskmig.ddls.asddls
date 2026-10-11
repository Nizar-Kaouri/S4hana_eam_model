// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation.
// Purpose: Read WarehouseTaskMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseTaskMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_WarehouseTaskMig
  as select from ZWMX_I_WarehouseTask as src
{
  key src.Warehouse as Warehouse,
  key src.WarehouseTask as WarehouseTask,
      src.WarehouseOrder as WarehouseOrder,
      src.TaskStatus as TaskStatus,
      src.CreatedBy as CreatedBy,
      src.ActivityArea as ActivityArea,
      src.SourceStorageType as SourceStorageType,
      src.TargetStorageType as TargetStorageType,
      src.TargetStorageSection as TargetStorageSection,
      src.Owner as Owner,
      src.OwnerRole as OwnerRole,
      src.Unit as Unit
}
