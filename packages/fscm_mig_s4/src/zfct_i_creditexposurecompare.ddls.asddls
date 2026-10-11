// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native liability snapshot in stored currency; not a delta feed or posting payload. Declared grain including currency is a DDIC candidate. Derived currency-type and message-party fields are excluded; cross-segment/report-currency aggregation remains pending.
// Purpose: Read CreditExposureCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-004: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditExposureCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_CreditExposureCompare
  as select from ukm_totals as src
{
  key src.partner as BusinessPartner,
  key src.credit_sgmnt as CreditSegment,
  key src.comm_typ as ExposureCategory,
      @Semantics.currencyCode: true
  key src.currency as Currency,
      @Semantics.amount.currencyCode: 'Currency'
      src.amount as ExposureAmount,
      @Semantics.amount.currencyCode: 'Currency'
      src.amount_sec as SecuredAmount
}
