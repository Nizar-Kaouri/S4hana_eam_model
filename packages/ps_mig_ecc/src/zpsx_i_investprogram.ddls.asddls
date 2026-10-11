// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestProgram as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestProgram'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_InvestProgram
  as select from ZPSX_I_InvestProgramData as src
{
  key src.InvestmentProgram as InvestmentProgram,
  key src.ApprovalFiscalYear as ApprovalFiscalYear,
      src.InvestmentProgramDescription as InvestmentProgramDescription
}
