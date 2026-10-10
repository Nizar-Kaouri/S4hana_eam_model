// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: CreditLimit and its currency context require UKMCRED_SGM0C verification; no fictitious segment currency column is supplied.
// Purpose: Read CreditSegmentMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V003C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditSegmentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_CreditSegmentMig
  as select from ZFCX_I_CreditSegment as src
{
  key src.BusinessPartner as BusinessPartner,
  key src.CreditSegment as CreditSegment,
      src.Blocked as Blocked,
      src.LimitValidTo as LimitValidTo,
      src.LimitChangedOn as LimitChangedOn,
      src.Coordinator as Coordinator,
      src.BlockReason as BlockReason,
      src.Critical as Critical,
      src.ZeroLimit as ZeroLimit
}
