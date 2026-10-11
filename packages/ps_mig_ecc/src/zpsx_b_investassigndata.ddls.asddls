// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestAssignData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestAssignData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_B_InvestAssignData
  as select from imzo as src
{
  key src.posnr as InvestmentPositionInternalID,
  key src.objnr as AssignedObject,
  key src.gjahr as ApprovalFiscalYear,
      src.prozu as AssignmentPercentage
}
