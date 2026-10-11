// ModuPorter EAM migration | Release 1.0.0
// Purpose: Class assignments of equipment (002) and functional locations (003).
// Example: The load program assigns the classes after the technical objects are loaded.
@AbapCatalog.sqlViewName: 'ZEMX_CCLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Class assignment (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_ClassAssignmentMig
  as select from ZEMX_I_ClassAssignment as src
{
      @EndUserText.label: 'Classified Object'
  key src.ClassifiedObject     as ClassifiedObject,
      @EndUserText.label: 'Class Type'
  key src.ClassType            as ClassType,
      @EndUserText.label: 'Class'
  key src.Class                as Class,
      @EndUserText.label: 'Classification Status'
      src.ClassificationStatus as ClassificationStatus
}
where src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )
