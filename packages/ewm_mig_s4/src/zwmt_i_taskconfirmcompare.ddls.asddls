// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TaskConfirmCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskConfirmCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_TaskConfirmCompare
  as select from zwmt_wmt010 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as WarehouseTask,
  key src.f006 as ConfirmationID,
      src.f007 as ConfirmedQuantity,
      src.f008 as DifferenceQuantity,
      src.f009 as QuantityUnit,
      src.f010 as ConfirmedAtUTC,
      src.f011 as ReversalStatus
}
