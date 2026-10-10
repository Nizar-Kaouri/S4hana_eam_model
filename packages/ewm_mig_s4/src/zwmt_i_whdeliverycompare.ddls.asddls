// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WhDeliveryCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WhDeliveryCompare
  as select from zwmt_wmt012 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as DeliveryID,
      src.f006 as DeliveryCategory,
      src.f007 as ExternalDelivery,
      src.f008 as Partner,
      src.f009 as DeliveryStatus,
      src.f010 as PlannedAtUTC
}
