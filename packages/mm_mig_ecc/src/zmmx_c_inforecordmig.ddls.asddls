// ModuPorter MM migration | Release 1.0.0
// Purpose: Read InfoRecordMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V022C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoRecordMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_InfoRecordMig
  as select from ZMMX_I_InfoRecord as src
{
  key src.PurchasingInfoRecord as PurchasingInfoRecord,
      src.Product as Product,
      src.Supplier as Supplier,
      src.ProductGroup as ProductGroup,
      src.OrderUnit as OrderUnit,
      src.DeletionFlag as DeletionFlag
}
