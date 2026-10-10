// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BatchGeneral as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BatchGeneral'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_BatchGeneral
  as select from ZMMX_I_BatchGeneralData as src
{
  key src.Product as Product,
  key src.Batch as Batch,
      src.ManufactureDate as ManufactureDate,
      src.ExpirationDate as ExpirationDate
}
