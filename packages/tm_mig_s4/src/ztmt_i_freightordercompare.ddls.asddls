// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrderCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrderCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_FreightOrderCompare
  as select from ztmt_tmt014 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as FreightOrderID,
      src.f005 as NativeGUID,
      src.f006 as DocumentCategory,
      src.f007 as OrderType,
      src.f008 as Carrier,
      src.f009 as ResourceID,
      src.f010 as ExecutionStatus,
      src.f011 as SettlementStatus
}
