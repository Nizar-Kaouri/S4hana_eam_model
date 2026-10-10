// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Characteristic values of equipment and functional locations; numeric values in the base unit.
// Example: The load program sets the values after the class assignment.
@AbapCatalog.sqlViewName: 'ZEMX_CCLV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Characteristic value (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_CharcValueMig
  as select from ZEMX_I_CharcValue as src
{
      @EndUserText.label: 'Classified Object'
  key src.ClassifiedObject         as ClassifiedObject,
      @EndUserText.label: 'Class Type'
  key src.ClassType                as ClassType,
      @EndUserText.label: 'Characteristic'
  key src.Characteristic           as Characteristic,
      @EndUserText.label: 'Charc Value Position Number'
  key src.CharcValuePositionNumber as CharcValuePositionNumber,
      @EndUserText.label: 'Charc Value'
      src.CharcValue               as CharcValue,
      @EndUserText.label: 'Charc From Numeric Value'
      src.CharcFromNumericValue    as CharcFromNumericValue,
      @EndUserText.label: 'Charc To Numeric Value'
      src.CharcToNumericValue      as CharcToNumericValue,
      @EndUserText.label: 'Charc Value Dependency'
      src.CharcValueDependency     as CharcValueDependency
}
where src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )
