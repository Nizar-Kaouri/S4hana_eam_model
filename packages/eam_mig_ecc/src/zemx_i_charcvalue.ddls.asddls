// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Characteristic values of classified objects with the characteristic name instead of the internal number.
// Example: Extract the values of equipment 10000001: filter ClassType = '002' and ClassifiedObject = '000000000010000001'.
@AbapCatalog.sqlViewName: 'ZEMX_CLV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Characteristic value (migration extract)'
@ObjectModel.representativeKey: 'CharcValuePositionNumber'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_I_CharcValue
  as select from ausp
    inner join cabn on cabn.atinn = ausp.atinn and cabn.adzhl = '0000'
{
  key ausp.objek as ClassifiedObject,
  key ausp.atinn as CharcInternalID,
  key ausp.atzhl as CharcValuePositionNumber,
  key ausp.klart as ClassType,
  key ausp.adzhl as ChangeCounter,
      // TODO-VERIFY[M] XCL-003: CABN rows without engineering change management have ADZHL = '0000'
      cabn.atnam as Characteristic,
      ausp.atwrt as CharcValue,
      // TODO-VERIFY[H] XCL-004: numeric values are floating point numbers in the characteristic's base unit; dates / times are also stored as numbers
      ausp.atflv as CharcFromNumericValue,
      ausp.atflb as CharcToNumericValue,
      ausp.atcod as CharcValueDependency,
      ausp.lkenz as IsMarkedForDeletion
}
where ausp.mafid = 'O'
