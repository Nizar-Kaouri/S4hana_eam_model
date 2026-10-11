// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestAssign as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V014R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestAssign'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_InvestAssign
  as select from ZPSX_B_InvestAssignData as src
{
  key src.InvestmentPositionInternalID as InvestmentPositionInternalID,
  key src.AssignedObject as AssignedObject,
  key src.ApprovalFiscalYear as ApprovalFiscalYear,
      src.AssignmentPercentage as AssignmentPercentage
}
