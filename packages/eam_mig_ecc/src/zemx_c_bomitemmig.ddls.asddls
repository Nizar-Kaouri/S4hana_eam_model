// ModuPorter EAM migration | Release 1.0.0
// Purpose: BOMItem state ledger for customer resolver
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N11C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'BOMItem state ledger for customer resolver'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_BOMItemMig
  as select from ZEMX_I_BOMItem as src
{
      @EndUserText.label: 'B O M Category'
  key src.BOMCategory as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key src.BillOfMaterial as BillOfMaterial,
      @EndUserText.label: 'B O M Item Node'
  key src.BOMItemNode as BOMItemNode,
      @EndUserText.label: 'Item Counter'
  key src.ItemCounter as ItemCounter,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'B O M Item Number'
      src.BOMItemNumber as BOMItemNumber,
      @EndUserText.label: 'B O M Item Category'
      src.BOMItemCategory as BOMItemCategory,
      @EndUserText.label: 'Component Material'
      src.ComponentMaterial as ComponentMaterial,
      @EndUserText.label: 'Component Quantity'
      @Semantics.quantity.unitOfMeasure: 'ComponentUnit'
      src.ComponentQuantity as ComponentQuantity,
      @EndUserText.label: 'Component Unit'
      @Semantics.unitOfMeasure: true
      src.ComponentUnit as ComponentUnit,
      @EndUserText.label: 'Is Marked For Deletion'
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
