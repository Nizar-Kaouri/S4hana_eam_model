// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BOMHeaderData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BOMHeaderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_BOMHeaderData
  as select from stko as src
{
  key src.stlty as BOMCategory,
  key src.stlnr as BillOfMaterial,
  key src.stlal as BillOfMaterialVariant,
  key src.stkoz as InternalCounter,
      src.datuv as ValidFromDate,
      src.aennr as ChangeNumber,
      src.lkenz as DeletionFlag,
      src.bmeng as BaseQuantity,
      src.bmein as BaseUnit
}
