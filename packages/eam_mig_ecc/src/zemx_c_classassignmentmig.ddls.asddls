// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Class assignments of equipment (002) and functional locations (003) with the object key translated.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'EQUIPMENT' and map01.SourceValue = src.ClassifiedObject and src.ClassType = '002'
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'FUNCTIONAL_LOCATION' and map02.SourceValue = src.ClassifiedObject and src.ClassType = '003'
{
  key src.ClassifiedObject           as LegacyClassifiedObject,
  key src.ClassType                  as ClassType,
  key src.Class                      as Class,
      coalesce( map01.TargetValue, coalesce( map02.TargetValue, src.ClassifiedObject ) ) as ClassifiedObject,
      src.ClassificationStatus       as ClassificationStatus
}
where src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )
