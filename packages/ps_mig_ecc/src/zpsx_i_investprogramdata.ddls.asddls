// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestProgramData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestProgramData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_InvestProgramData
  as select from imtp as src
{
  key src.prnam as InvestmentProgram,
  key src.gjahr as ApprovalFiscalYear,
      src.txt50 as InvestmentProgramDescription
}
