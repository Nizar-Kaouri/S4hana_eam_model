// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CommitmentData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V011'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CommitmentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_CommitmentData
  as select from cooi as src
{
  key src.objnr as ObjectNumber,
  key src.gjahr as FiscalYear,
  key src.wrttp as ValueType,
  key src.versn as Version,
  key src.kstar as CostElement,
  key src.hrkft as OriginGroup,
  key src.vrgng as BusinessTransaction,
  key src.belnr as CommitmentDocument,
  key src.buzei as CommitmentItem,
      src.twaer as TransactionCurrency,
      src.wtgbtr as TransactionAmount,
      src.wogbtr as ObjectCurrencyAmount,
      src.wkgbtr as ControllingAreaAmount
}
