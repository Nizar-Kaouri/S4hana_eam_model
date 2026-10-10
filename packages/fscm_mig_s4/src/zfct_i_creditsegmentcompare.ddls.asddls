// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: CreditLimit and its currency context require UKMCRED_SGM0C verification; no fictitious segment currency column is supplied.
// Purpose: Read CreditSegmentCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditSegmentCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_CreditSegmentCompare
  as select from ukmbp_cms_sgm as src
{
  key src.partner as BusinessPartner,
  key src.credit_sgmnt as CreditSegment,
      src.xblocked as Blocked,
      src.limit_valid_date as LimitValidTo,
      src.limit_chg_date as LimitChangedOn,
      src.coordinator as Coordinator,
      src.block_reason as BlockReason,
      src.xcritical as Critical,
      src.x_limit_zero as ZeroLimit
}
