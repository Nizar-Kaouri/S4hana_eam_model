// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionOrdeData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOrdeData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_ProductionOrdeData
  as select from aufk as src
{
  key src.aufnr as ManufacturingOrder,
      src.auart as ManufacturingOrderType,
      src.autyp as OrderCategory,
      src.ktext as ManufacturingOrderText,
      src.bukrs as CompanyCode,
      src.werks as ProductionPlant,
      src.objnr as ObjectNumber
}
