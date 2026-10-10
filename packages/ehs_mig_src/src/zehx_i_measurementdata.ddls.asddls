// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MeasurementData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-018: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V018'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MeasurementData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_MeasurementData
  as select from zehx_ehs018 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as CollectionID,
  key src.f005 as MeasurementID,
      src.f006 as MeasuredAtUTC,
      src.f007 as Value,
      src.f008 as QuantityUnit,
      src.f009 as MethodID,
      src.f010 as QualityStatus
}
