// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightUnitIteData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitIteData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightUnitIteData
  as select from ztmx_tms012 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as FreightUnitID,
  key src.f005 as ItemID,
      src.f006 as Product,
      src.f007 as Quantity,
      src.f008 as QuantityUnit,
      src.f009 as GrossWeight,
      src.f010 as WeightUnit,
      src.f011 as ReferenceDocument,
      src.f012 as ReferenceItem
}
