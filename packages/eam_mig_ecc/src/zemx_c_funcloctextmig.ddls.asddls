// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Descriptions of the functional locations in scope per language.
// Example: Read the texts of FL 1000-PUMP-01: filter FunctionalLocation = '1000-PUMP-01'.
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
  association [0..1] to ZEMX_I_FuncLoc as _FuncLoc on _FuncLoc.FunctionalLocation = $projection.FunctionalLocation
{
  key src.FunctionalLocation     as FunctionalLocation,
      @Semantics.language: true
  key src.Language               as Language,
      @Semantics.text: true
      src.FunctionalLocationName as FunctionalLocationName
}
where _FuncLoc.IsMarkedForDeletion = ''
