// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WhDelivery as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDelivery'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WhDelivery
  as select from ZWMX_I_WhDeliveryData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.DeliveryID as DeliveryID,
      src.DeliveryCategory as DeliveryCategory,
      src.ExternalDelivery as ExternalDelivery,
      src.Partner as Partner,
      src.DeliveryStatus as DeliveryStatus,
      src.PlannedAtUTC as PlannedAtUTC
}
