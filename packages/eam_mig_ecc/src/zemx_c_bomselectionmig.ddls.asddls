// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: BOMSelection state ledger for customer resolver
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N10C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'BOMSelection state ledger for customer resolver'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_BOMSelectionMig
  as select from ZEMX_I_BOMSelection as src
{
      @EndUserText.label: 'B O M Category'
  key src.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key src.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
  key src.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'B O M Item Node'
  key src.BOMItemNode as BOMItemNode,
      @EndUserText.label: 'Selection Counter'
  key src.SelectionCounter as SelectionCounter,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Is Marked For Deletion'
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
