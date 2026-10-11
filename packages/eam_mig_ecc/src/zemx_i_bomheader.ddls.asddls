// ModuPorter EAM migration | Release 1.0.0
// Purpose: BOMHeader versioned business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N9I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMHeader versioned business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_BOMHeader
  as select from ZEMX_B_BOMHeaderData as b
{
      @EndUserText.label: 'B O M Category'
  key b.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key b.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
  key b.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'Header Counter'
  key b.HeaderCounter as HeaderCounter,
      @EndUserText.label: 'Validity Start Date'
      b.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion,
      @EndUserText.label: 'Base Quantity'
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      b.BaseQuantity as BaseQuantity,
      @EndUserText.label: 'Base Unit'
      @Semantics.unitOfMeasure: true
      b.BaseUnit as BaseUnit
}
