// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native liability snapshot in stored currency; not a delta feed or posting payload. Declared grain including currency is a DDIC candidate. Derived currency-type and message-party fields are excluded; cross-segment/report-currency aggregation remains pending.
// Purpose: Read CreditExposure as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CreditExposure'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_CreditExposure
  as select from ZFCX_B_CreditExposureData as src
{
  key src.BusinessPartner as BusinessPartner,
  key src.CreditSegment as CreditSegment,
  key src.ExposureCategory as ExposureCategory,
      @Semantics.currencyCode: true
  key src.Currency as Currency,
      @Semantics.amount.currencyCode: 'Currency'
      src.ExposureAmount as ExposureAmount,
      @Semantics.amount.currencyCode: 'Currency'
      src.SecuredAmount as SecuredAmount
}
