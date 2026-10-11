// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ConfirmationMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V017C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConfirmationMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ConfirmationMig
  as select from ZPPX_I_Confirmation as src
{
  key src.ConfirmationNumber as ConfirmationNumber,
  key src.ConfirmationCounter as ConfirmationCounter,
      src.ManufacturingOrder as ManufacturingOrder,
      src.Operation as Operation,
      src.PostingDate as PostingDate,
      src.FinalConfirmation as FinalConfirmation,
      src.ReversalFlag as ReversalFlag,
      src.ReversalCounter as ReversalCounter,
      src.YieldQuantity as YieldQuantity,
      src.ScrapQuantity as ScrapQuantity,
      src.ConfirmationUnit as ConfirmationUnit
}
