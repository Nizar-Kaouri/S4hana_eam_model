// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ResCapacity as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ResCapacity'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_ResCapacity
  as select from ZTMX_I_ResCapacityData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.ResourceID as ResourceID,
  key src.CapacityID as CapacityID,
      src.CapacityType as CapacityType,
      src.CapacityValue as CapacityValue,
      src.CapacityUnit as CapacityUnit
}
