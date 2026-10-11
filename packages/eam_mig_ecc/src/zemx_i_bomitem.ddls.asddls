// ModuPorter EAM migration | Release 1.0.0
// Purpose: BOMItem versioned business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N11I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMItem versioned business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_BOMItem
  as select from ZEMX_B_BOMItemData as b
{
      @EndUserText.label: 'B O M Category'
  key b.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key b.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Item Node'
  key b.BOMItemNode as BOMItemNode,
      @EndUserText.label: 'Item Counter'
  key b.ItemCounter as ItemCounter,
      @EndUserText.label: 'Validity Start Date'
      b.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'B O M Item Number'
      b.BOMItemNumber as BOMItemNumber,
      @EndUserText.label: 'B O M Item Category'
      b.BOMItemCategory as BOMItemCategory,
      @EndUserText.label: 'Component Material'
      b.ComponentMaterial as ComponentMaterial,
      @EndUserText.label: 'Component Quantity'
      @Semantics.quantity.unitOfMeasure: 'ComponentUnit'
      b.ComponentQuantity as ComponentQuantity,
      @EndUserText.label: 'Component Unit'
      @Semantics.unitOfMeasure: true
      b.ComponentUnit as ComponentUnit,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
