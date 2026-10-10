// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.ClassifiedObject     as ClassifiedObject,
  key src.ClassType            as ClassType,
  key src.Class                as Class,
      src.ClassificationStatus as ClassificationStatus
}
where src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )
