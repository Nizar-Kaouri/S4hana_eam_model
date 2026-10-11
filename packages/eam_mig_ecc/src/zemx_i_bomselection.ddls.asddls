// ModuPorter EAM migration | Release 1.0.0
// Purpose: BOMSelection versioned business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N10I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMSelection versioned business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_BOMSelection
  as select from ZEMX_B_BOMSelectionData as b
{
      @EndUserText.label: 'B O M Category'
  key b.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key b.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
  key b.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'B O M Item Node'
  key b.BOMItemNode as BOMItemNode,
      @EndUserText.label: 'Selection Counter'
  key b.SelectionCounter as SelectionCounter,
      @EndUserText.label: 'Validity Start Date'
      b.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
