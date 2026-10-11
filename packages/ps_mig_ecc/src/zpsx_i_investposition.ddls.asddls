// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestPosition as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestPosition'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_InvestPosition
  as select from ZPSX_B_InvestPositionData as src
{
  key src.InvestmentPositionInternalID as InvestmentPositionInternalID,
      src.InvestmentProgram as InvestmentProgram,
      src.ApprovalFiscalYear as ApprovalFiscalYear,
      src.InvestmentPosition as InvestmentPosition,
      src.ObjectNumber as ObjectNumber
}
