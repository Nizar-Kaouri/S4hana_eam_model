// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialLocati as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialLocati'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialLocati
  as select from ZMMX_I_MaterialLocatiData as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.StorageLocation as StorageLocation,
      src.DeletionFlag as DeletionFlag
}
