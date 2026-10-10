// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Class assignments of objects (class type 002 equipment, 003 functional location, ...) with the class name instead of the internal class number.
// Example: Extract the equipment classes: filter ClassType = '002'.
@AbapCatalog.sqlViewName: 'ZEMX_CLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Class assignment (migration extract)'
@ObjectModel.representativeKey: 'ClassInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_ClassAssignment
  as select from kssk
    inner join klah on klah.clint = kssk.clint
{
      // TODO-VERIFY[H] XCL-001: KSSK/AUSP-OBJEK is the equipment number for class type 002 and the internal functional location key for 003; CHAR comparison of OBJEK with other key lengths in joins
  key kssk.objek as ClassifiedObject,
  key kssk.klart as ClassType,
  key kssk.clint as ClassInternalID,
  key kssk.adzhl as ChangeCounter,
      klah.class as Class,
      // TODO-VERIFY[M] XCL-002: KSSK-STATU, KSSK-LKENZ, AUSP-ATCOD, AUSP-LKENZ field names
      kssk.statu as ClassificationStatus,
      kssk.lkenz as IsMarkedForDeletion
}
where kssk.mafid = 'O'
