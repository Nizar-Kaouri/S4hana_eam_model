// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SettleItemCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-019: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SettleItemCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_SettleItemCompare
  as select from ztmt_tmt019 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as SettlementID,
  key src.f005 as SettlementItem,
      src.f006 as ChargeType,
      src.f007 as Amount,
      src.f008 as Currency,
      src.f009 as TaxCode,
      src.f010 as ReferenceItem
}
