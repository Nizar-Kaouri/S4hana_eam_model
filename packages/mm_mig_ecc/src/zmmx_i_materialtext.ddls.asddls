// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialText as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialText'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialText
  as select from ZMMX_I_MaterialTextData as src
{
  key src.Product as Product,
  key src.Language as Language,
      src.ProductDescription as ProductDescription
}
