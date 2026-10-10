// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: BOMItem equipment-category state ledger
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-11: Confirm STPO keys, selected fields and engineering-change validity; E is the assumed equipment BOM category.
@AbapCatalog.sqlViewName: 'ZEMX_N11B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMItem equipment-category state ledger'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_BOMItemData
  as select from stpo as t
{
      @EndUserText.label: 'B O M Category'
  key t.stlty as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key t.stlnr as BillOfMaterial,
      @EndUserText.label: 'B O M Item Node'
  key t.stlkn as BOMItemNode,
      @EndUserText.label: 'Item Counter'
  key t.stpoz as ItemCounter,
      @EndUserText.label: 'Validity Start Date'
      t.datuv as ValidityStartDate,
      @EndUserText.label: 'B O M Item Number'
      t.posnr as BOMItemNumber,
      @EndUserText.label: 'B O M Item Category'
      t.postp as BOMItemCategory,
      @EndUserText.label: 'Component Material'
      t.idnrk as ComponentMaterial,
      @EndUserText.label: 'Component Quantity'
      t.menge as ComponentQuantity,
      @EndUserText.label: 'Component Unit'
      t.meins as ComponentUnit,
      @EndUserText.label: 'Is Marked For Deletion'
      t.lkenz as IsMarkedForDeletion
}
where t.stlty = 'E'
