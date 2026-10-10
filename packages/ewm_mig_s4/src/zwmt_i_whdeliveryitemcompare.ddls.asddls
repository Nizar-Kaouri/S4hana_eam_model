// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WhDeliveryItemCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-013: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryItemCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WhDeliveryItemCompare
  as select from zwmt_wmt013 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as DeliveryID,
  key src.f006 as DeliveryItem,
      src.f007 as Product,
      src.f008 as Batch,
      src.f009 as Quantity,
      src.f010 as QuantityUnit,
      src.f011 as HandlingUnit,
      src.f012 as ReferenceDocument,
      src.f013 as ReferenceItem
}
