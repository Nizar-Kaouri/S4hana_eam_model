// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: FuncLocLabel migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N50C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'FuncLocLabel migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocLabelMig
  as select from ZEMX_I_FuncLocLabel as src
  association [0..1] to ZEMX_I_FuncLoc as _Parent on _Parent.FunctionalLocation = $projection.FunctionalLocation
{
      @EndUserText.label: 'Functional Location'
  key src.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'Labeling System'
  key src.LabelingSystem as LabelingSystem,
      @EndUserText.label: 'Alternative Label'
      src.AlternativeLabel as AlternativeLabel,
      @EndUserText.label: 'Is Active Label'
      src.IsActiveLabel as IsActiveLabel
}
where _Parent.IsMarkedForDeletion = ''
