// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostActualData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostActualData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_B_CostActualData
  as select from coep as src
{
  key src.kokrs as ControllingArea,
  key src.belnr as COAccountingDocument,
  key src.buzei as COAccountingDocumentItem,
      src.gjahr as FiscalYear,
      src.objnr as ObjectNumber,
      src.kstar as CostElement,
      src.wrttp as ValueType,
      src.vrgng as BusinessTransaction,
      src.wtgbtr as TransactionAmount,
      src.twaer as TransactionCurrency
}
