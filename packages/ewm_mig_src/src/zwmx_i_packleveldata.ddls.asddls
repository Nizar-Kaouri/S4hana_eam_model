// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PackLevelData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-015: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V015'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PackLevelData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_PackLevelData
  as select from zwmx_wms015 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as PackSpecification,
  key src.f005 as Version,
  key src.f006 as LevelID,
      src.f007 as ParentLevel,
      src.f008 as PackagingProduct,
      src.f009 as TargetQuantity,
      src.f010 as QuantityUnit
}
