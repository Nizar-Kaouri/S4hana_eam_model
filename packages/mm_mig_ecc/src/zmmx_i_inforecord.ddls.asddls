// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InfoRecord as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V022R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoRecord'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_InfoRecord
  as select from ZMMX_I_InfoRecordData as src
{
  key src.PurchasingInfoRecord as PurchasingInfoRecord,
      src.Product as Product,
      src.Supplier as Supplier,
      src.ProductGroup as ProductGroup,
      src.OrderUnit as OrderUnit,
      src.DeletionFlag as DeletionFlag
}
