// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialBOMMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V007N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialBOMMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_MaterialBOMMigCount
  as select from ZPPX_C_MaterialBOMMig as src
{
  key src.Material as Material,
      count( * ) as RecordCount
}
group by src.Material
