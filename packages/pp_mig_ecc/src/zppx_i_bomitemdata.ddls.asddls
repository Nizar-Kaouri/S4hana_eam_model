// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BOMItemData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V010'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_BOMItemData
  as select from stpo as src
{
  key src.stlty as BOMCategory,
  key src.stlnr as BillOfMaterial,
  key src.stlkn as BOMNode,
  key src.stpoz as InternalCounter,
      src.datuv as ValidFromDate,
      src.aennr as ChangeNumber,
      src.lkenz as DeletionFlag,
      src.idnrk as Component,
      src.posnr as ItemNumber,
      src.menge as ComponentQuantity,
      src.meins as Unit
}
