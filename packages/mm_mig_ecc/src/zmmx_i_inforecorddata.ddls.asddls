// ModuPorter MM migration | Release 1.0.0
// Purpose: Read InfoRecordData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V022'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoRecordData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_InfoRecordData
  as select from eina as src
{
  key src.infnr as PurchasingInfoRecord,
      src.matnr as Product,
      src.lifnr as Supplier,
      src.matkl as ProductGroup,
      src.meins as OrderUnit,
      src.loekz as DeletionFlag
}
