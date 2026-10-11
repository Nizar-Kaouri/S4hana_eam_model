// ModuPorter EAM migration | Release 1.0.0
// Purpose: Class assignments with the class name instead of the internal class number.
// Example: Read the equipment classes: filter ClassType = '002'.
@AbapCatalog.sqlViewName: 'ZMMX_CL121'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Class assignment'
@ObjectModel.representativeKey: 'ClassInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_ClassAssignment
  as select from ZMMX_B_ObjectClassAssgmt as asg
{
      @EndUserText.label: 'Classified Object'
  key asg.ClassifiedObject     as ClassifiedObject,
      @EndUserText.label: 'Class Type'
  key asg.ClassType            as ClassType,
      @EndUserText.label: 'Class Internal ID'
  key asg.ClassInternalID      as ClassInternalID,
      @EndUserText.label: 'Change Counter'
  key asg.ChangeCounter        as ChangeCounter,
      @EndUserText.label: 'Class'
      asg._Class.Class         as Class,
      @EndUserText.label: 'Classification Status'
      asg.ClassificationStatus as ClassificationStatus,
      @EndUserText.label: 'Is Marked For Deletion'
      asg.IsMarkedForDeletion  as IsMarkedForDeletion
}
