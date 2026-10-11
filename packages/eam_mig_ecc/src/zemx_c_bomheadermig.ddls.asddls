// ModuPorter EAM migration | Release 1.0.0
// Purpose: BOMHeader state ledger for customer resolver
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N9C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'BOMHeader state ledger for customer resolver'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_BOMHeaderMig
  as select from ZEMX_I_BOMHeader as src
{
      @EndUserText.label: 'B O M Category'
  key src.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key src.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
  key src.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'Header Counter'
  key src.HeaderCounter as HeaderCounter,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Is Marked For Deletion'
      src.IsMarkedForDeletion as IsMarkedForDeletion,
      @EndUserText.label: 'Base Quantity'
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      src.BaseQuantity as BaseQuantity,
      @EndUserText.label: 'Base Unit'
      @Semantics.unitOfMeasure: true
      src.BaseUnit as BaseUnit
}
