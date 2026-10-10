// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Characteristic values of objects (AUSP, object indicator 'O').
// Example: Read the values of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_AUSP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Object characteristic value'
@ObjectModel.representativeKey: 'CharcValuePositionNumber'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_I_ObjectCharcValue
  as select from ausp
  association [0..1] to ZEMX_I_Characteristic as _Characteristic on $projection.CharcInternalID = _Characteristic.CharcInternalID
{
  key ausp.objek as ClassifiedObject,
  key ausp.atinn as CharcInternalID,
  key ausp.atzhl as CharcValuePositionNumber,
  key ausp.klart as ClassType,
  key ausp.adzhl as ChangeCounter,
      ausp.atwrt as CharcValue,
      // TODO-VERIFY[H] XCL-004: numeric values are floating point numbers in the characteristic's base unit; dates / times are also stored as numbers
      ausp.atflv as CharcFromNumericValue,
      ausp.atflb as CharcToNumericValue,
      ausp.atcod as CharcValueDependency,
      ausp.lkenz as IsMarkedForDeletion,
      _Characteristic
}
where ausp.mafid = 'O'
