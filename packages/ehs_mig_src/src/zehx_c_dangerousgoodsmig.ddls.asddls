// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DangerousGoodsMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V022C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DangerousGoodsMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_DangerousGoodsMig
  as select from ZEHX_I_DangerousGoods as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Product as Product,
  key src.RegulationID as RegulationID,
  key src.Version as Version,
      src.UNNumber as UNNumber,
      src.ProperShippingName as ProperShippingName,
      src.HazardClass as HazardClass,
      src.PackingGroup as PackingGroup,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
