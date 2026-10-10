// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightUnitIteCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitIteCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_FreightUnitIteCompare
  as select from ztmt_tmt012 as src
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
