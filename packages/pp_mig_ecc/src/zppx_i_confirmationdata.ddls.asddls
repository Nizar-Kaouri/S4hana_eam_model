// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ConfirmationData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V017'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConfirmationData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_ConfirmationData
  as select from afru as src
{
  key src.rueck as ConfirmationNumber,
  key src.rmzhl as ConfirmationCounter,
      src.aufnr as ManufacturingOrder,
      src.vornr as Operation,
      src.budat as PostingDate,
      src.aueru as FinalConfirmation,
      src.stokz as ReversalFlag,
      src.stzhl as ReversalCounter,
      src.lmnga as YieldQuantity,
      src.xmnga as ScrapQuantity,
      src.gmein as ConfirmationUnit
}
