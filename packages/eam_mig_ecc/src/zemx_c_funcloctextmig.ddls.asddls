// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Descriptions of the functional locations in scope per language.
// Example: Read the texts of FL 1000-PUMP-01: filter LegacyFunctionalLocation = '1000-PUMP-01'.
@AbapCatalog.sqlViewName: 'ZEMX_CFLT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location text (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocTextMig
  as select from ZEMX_I_FuncLocDesc as src
    inner join ZEMX_I_FuncLoc as obj on obj.FunctionalLocation = src.FunctionalLocation
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'FUNCTIONAL_LOCATION' and map01.SourceValue = src.FunctionalLocation
{
  key src.FunctionalLocation         as LegacyFunctionalLocation,
  key src.Language                   as Language,
      coalesce( map01.TargetValue, src.FunctionalLocation ) as FunctionalLocation,
      @Semantics.text: true
      src.FunctionalLocationName     as FunctionalLocationName
}
where obj.IsMarkedForDeletion = ''
