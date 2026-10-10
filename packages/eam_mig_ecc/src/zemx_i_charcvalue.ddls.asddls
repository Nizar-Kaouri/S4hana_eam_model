// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Characteristic values with the characteristic name instead of the internal number.
// Example: Read the values of equipment 10000001: filter ClassType = '002'.
@AbapCatalog.sqlViewName: 'ZEMX_CLV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Characteristic value'
@ObjectModel.representativeKey: 'CharcValuePositionNumber'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #COMPOSITE
define view ZEMX_I_CharcValue
  as select from ZEMX_I_ObjectCharcValue as val
{
  key val.ClassifiedObject           as ClassifiedObject,
  key val.CharcInternalID            as CharcInternalID,
  key val.CharcValuePositionNumber   as CharcValuePositionNumber,
  key val.ClassType                  as ClassType,
  key val.ChangeCounter              as ChangeCounter,
      val._Characteristic.Characteristic as Characteristic,
      val.CharcValue                 as CharcValue,
      val.CharcFromNumericValue      as CharcFromNumericValue,
      val.CharcToNumericValue        as CharcToNumericValue,
      val.CharcValueDependency       as CharcValueDependency,
      val.IsMarkedForDeletion        as IsMarkedForDeletion
}
