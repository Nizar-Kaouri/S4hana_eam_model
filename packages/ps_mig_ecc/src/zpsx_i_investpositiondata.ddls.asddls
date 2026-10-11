// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestPositionData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V013'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestPositionData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_InvestPositionData
  as select from impr as src
{
  key src.posnr as InvestmentPositionInternalID,
      src.prnam as InvestmentProgram,
      src.gjahr as ApprovalFiscalYear,
      src.posid as InvestmentPosition,
      src.objnr as ObjectNumber
}
