// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: CLIENT is the implicit current-client field. Credit relationships remain pending.
// Purpose: Read CreditProfileData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFCX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditProfileData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFCX_I_CreditProfileData
  as select from ukmbp_cms as src
{
  key src.partner as BusinessPartner,
      src.own_rating as OwnRating,
      src.check_rule as CheckRule,
      src.limit_rule as LimitRule,
      src.rating_val_date as RatingValidTo,
      src.risk_class as RiskClass,
      src.credit_group as CreditGroup
}
