// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BOMSelectionData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMSelectionData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_BOMSelectionData
  as select from stas as src
{
  key src.stlty as BOMCategory,
  key src.stlnr as BillOfMaterial,
  key src.stlal as BillOfMaterialVariant,
  key src.stlkn as BOMNode,
  key src.stasz as InternalCounter,
      src.datuv as ValidFromDate,
      src.aennr as ChangeNumber,
      src.lkenz as DeletionFlag
}
