// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialValueData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialValueData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_MaterialValueData
  as select from mbew as src
{
  key src.matnr as Product,
  key src.bwkey as ValuationArea,
  key src.bwtar as ValuationType,
      src.bklas as ValuationClass,
      src.vprsv as PriceControl,
      src.stprs as StandardPrice,
      src.verpr as MovingAveragePrice,
      src.peinh as PriceUnit
}
