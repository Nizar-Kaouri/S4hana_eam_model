// ModuPorter EAM migration | Release 1.0.0
// Purpose: FuncLocLabel migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N50I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocLabel migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLocLabel
  as select from ZEMX_I_FuncLocLabelData as b
{
      @EndUserText.label: 'Functional Location'
  key b.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'Labeling System'
  key b.LabelingSystem as LabelingSystem,
      @EndUserText.label: 'Alternative Label'
      b.AlternativeLabel as AlternativeLabel,
      @EndUserText.label: 'Is Active Label'
      b.IsActiveLabel as IsActiveLabel
}
