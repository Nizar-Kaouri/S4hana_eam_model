// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InvestAssignMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V014C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestAssignMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_InvestAssignMig
  as select from ZPSX_I_InvestAssign as src
{
  key src.InvestmentPositionInternalID as InvestmentPositionInternalID,
  key src.AssignedObject as AssignedObject,
  key src.ApprovalFiscalYear as ApprovalFiscalYear,
      src.AssignmentPercentage as AssignmentPercentage
}
