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
      @EndUserText.label: 'Classified Object'
  key val.ClassifiedObject           as ClassifiedObject,
      @EndUserText.label: 'Charc Internal ID'
  key val.CharcInternalID            as CharcInternalID,
      @EndUserText.label: 'Charc Value Position Number'
  key val.CharcValuePositionNumber   as CharcValuePositionNumber,
      @EndUserText.label: 'Class Type'
  key val.ClassType                  as ClassType,
      @EndUserText.label: 'Change Counter'
  key val.ChangeCounter              as ChangeCounter,
      @EndUserText.label: 'Characteristic'
      val._Characteristic.Characteristic as Characteristic,
      @EndUserText.label: 'Charc Value'
      val.CharcValue                 as CharcValue,
      @EndUserText.label: 'Charc From Numeric Value'
      val.CharcFromNumericValue      as CharcFromNumericValue,
      @EndUserText.label: 'Charc To Numeric Value'
      val.CharcToNumericValue        as CharcToNumericValue,
      @EndUserText.label: 'Charc Value Dependency'
      val.CharcValueDependency       as CharcValueDependency,
      @EndUserText.label: 'Is Marked For Deletion'
      val.IsMarkedForDeletion        as IsMarkedForDeletion
}
