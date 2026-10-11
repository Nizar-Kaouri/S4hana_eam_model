// ModuPorter EAM migration | Release 1.0.0
// Purpose: FuncLocLabel source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm IFLOS keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N50B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocLabel source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_FuncLocLabelData
  as select from iflos as t
{
      @EndUserText.label: 'Functional Location'
  key t.tplnr as FunctionalLocation,
      @EndUserText.label: 'Labeling System'
  key t.altnr as LabelingSystem,
      @EndUserText.label: 'Alternative Label'
      t.strno as AlternativeLabel,
      @EndUserText.label: 'Is Active Label'
      t.actvs as IsActiveLabel
}
