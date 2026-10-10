// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightUnitMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightUnitMig
  as select from ZTMX_I_FreightUnit as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightUnitID as FreightUnitID,
      src.NativeGUID as NativeGUID,
      src.UnitType as UnitType,
      src.DocumentStatus as DocumentStatus,
      src.SourceLocation as SourceLocation,
      src.DestinationLocation as DestinationLocation
}
