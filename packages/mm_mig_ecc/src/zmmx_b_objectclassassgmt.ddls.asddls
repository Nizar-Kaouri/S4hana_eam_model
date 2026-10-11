// ModuPorter EAM migration | Release 1.0.0
// Purpose: Class assignments of objects (KSSK, object indicator 'O').
// Example: Read the classes of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZMMX_CL119'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Object class assignment'
@ObjectModel.representativeKey: 'ClassInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_ObjectClassAssgmt
  as select from kssk
  association [0..1] to ZMMX_B_ClassHeader as _Class on $projection.ClassInternalID = _Class.ClassInternalID
{
      // Compatibility note: KSSK/AUSP-OBJEK is the equipment number for class type 002 and the internal functional location key for 003
      @EndUserText.label: 'Classified Object'
  key kssk.objek as ClassifiedObject,
      @EndUserText.label: 'Class Type'
  key kssk.klart as ClassType,
      @EndUserText.label: 'Class Internal ID'
  key kssk.clint as ClassInternalID,
      @EndUserText.label: 'Change Counter'
  key kssk.adzhl as ChangeCounter,
      // Compatibility note: KSSK-STATU, KSSK-LKENZ, AUSP-ATCOD, AUSP-LKENZ field names
      @EndUserText.label: 'Classification Status'
      kssk.statu as ClassificationStatus,
      @EndUserText.label: 'Is Marked For Deletion'
      kssk.lkenz as IsMarkedForDeletion,
      _Class
}
where kssk.mafid = 'O'
