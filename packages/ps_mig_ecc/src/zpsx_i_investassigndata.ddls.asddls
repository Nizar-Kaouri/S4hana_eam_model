// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InvestAssignData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestAssignData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_InvestAssignData
  as select from imzo as src
{
  key src.posnr as InvestmentPositionInternalID,
  key src.objnr as AssignedObject,
  key src.gjahr as ApprovalFiscalYear,
      src.prozu as AssignmentPercentage
}
