// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InvestPositionMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestPositionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_InvestPositionMig
  as select from ZPSX_I_InvestPosition as src
{
  key src.InvestmentPositionInternalID as InvestmentPositionInternalID,
      src.InvestmentProgram as InvestmentProgram,
      src.ApprovalFiscalYear as ApprovalFiscalYear,
      src.InvestmentPosition as InvestmentPosition,
      src.ObjectNumber as ObjectNumber
}
