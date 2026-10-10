// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: CLIENT is the implicit current-client field. Credit relationships remain pending.
// Purpose: Read CreditProfile as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditProfile'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CreditProfile
  as select from ZFCX_I_CreditProfileData as src
{
  key src.BusinessPartner as BusinessPartner,
      src.OwnRating as OwnRating,
      src.CheckRule as CheckRule,
      src.LimitRule as LimitRule,
      src.RatingValidTo as RatingValidTo,
      src.RiskClass as RiskClass,
      src.CreditGroup as CreditGroup
}
