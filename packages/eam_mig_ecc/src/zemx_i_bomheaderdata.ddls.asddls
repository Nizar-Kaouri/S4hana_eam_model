// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: BOMHeader equipment-category state ledger
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-9: Confirm STKO keys, selected fields and engineering-change validity; E is the assumed equipment BOM category.
@AbapCatalog.sqlViewName: 'ZEMX_N9B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMHeader equipment-category state ledger'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_BOMHeaderData
  as select from stko as t
{
      @EndUserText.label: 'B O M Category'
  key t.stlty as BOMCategory,
      @EndUserText.label: 'Bill Of Material'
  key t.stlnr as BillOfMaterial,
      @EndUserText.label: 'B O M Alternative'
  key t.stlal as BOMAlternative,
      @EndUserText.label: 'Header Counter'
  key t.stkoz as HeaderCounter,
      @EndUserText.label: 'Validity Start Date'
      t.datuv as ValidityStartDate,
      @EndUserText.label: 'Is Marked For Deletion'
      t.lkenz as IsMarkedForDeletion,
      @EndUserText.label: 'Base Quantity'
      t.bmeng as BaseQuantity,
      @EndUserText.label: 'Base Unit'
      t.bmein as BaseUnit
}
where t.stlty = 'E'
