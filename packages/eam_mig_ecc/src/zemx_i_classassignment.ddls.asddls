// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Class assignments with the class name instead of the internal class number.
// Example: Read the equipment classes: filter ClassType = '002'.
@AbapCatalog.sqlViewName: 'ZEMX_CLA'
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
define view ZEMX_I_ClassAssignment
  as select from ZEMX_I_ObjectClassAssgmt as asg
{
  key asg.ClassifiedObject     as ClassifiedObject,
  key asg.ClassType            as ClassType,
  key asg.ClassInternalID      as ClassInternalID,
  key asg.ChangeCounter        as ChangeCounter,
      asg._Class.Class         as Class,
      asg.ClassificationStatus as ClassificationStatus,
      asg.IsMarkedForDeletion  as IsMarkedForDeletion
}
