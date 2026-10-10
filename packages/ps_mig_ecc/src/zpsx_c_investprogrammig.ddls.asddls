// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InvestProgramMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V012C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestProgramMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_InvestProgramMig
  as select from ZPSX_I_InvestProgram as src
{
  key src.InvestmentProgram as InvestmentProgram,
  key src.ApprovalFiscalYear as ApprovalFiscalYear,
      src.InvestmentProgramDescription as InvestmentProgramDescription
}
