// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read Confirmation as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V017R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Confirmation'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_Confirmation
  as select from ZPPX_I_ConfirmationData as src
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
