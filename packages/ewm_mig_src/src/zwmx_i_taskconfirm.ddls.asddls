// ModuPorter migration - status: draft-unverified (never activated on SAP)
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
  as select from ZWMX_I_TaskConfirmData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.WarehouseTask as WarehouseTask,
  key src.ConfirmationID as ConfirmationID,
      src.ConfirmedQuantity as ConfirmedQuantity,
      src.DifferenceQuantity as DifferenceQuantity,
      src.QuantityUnit as QuantityUnit,
      src.ConfirmedAtUTC as ConfirmedAtUTC,
      src.ReversalStatus as ReversalStatus
}
