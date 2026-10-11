// ModuPorter EAM migration | Release 1.0.0
// Purpose: BOMSelection equipment-category state ledger
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm STAS keys, selected fields and engineering-change validity; E is the assumed equipment BOM category.
@AbapCatalog.sqlViewName: 'ZEMX_N10B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMSelection equipment-category state ledger'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_BOMSelectionData
  as select from stas as t
{
      @EndUserText.label: 'B O M Category'
  key t.stlty as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key t.stlnr as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
  key t.stlal as BOMAlternative,
      @EndUserText.label: 'B O M Item Node'
  key t.stlkn as BOMItemNode,
      @EndUserText.label: 'Selection Counter'
  key t.stasz as SelectionCounter,
      @EndUserText.label: 'Validity Start Date'
      t.datuv as ValidityStartDate,
      @EndUserText.label: 'Is Marked For Deletion'
      t.lkenz as IsMarkedForDeletion
}
where t.stlty = 'E'
