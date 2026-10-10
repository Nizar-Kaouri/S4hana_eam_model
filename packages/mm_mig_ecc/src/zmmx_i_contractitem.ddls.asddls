// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ContractItem as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V025R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_ContractItem
  as select from ZMMX_I_ContractItemData as src
{
  key src.PurchasingContract as PurchasingContract,
  key src.PurchasingContractItem as PurchasingContractItem,
      src.Product as Product,
      src.Plant as Plant,
      src.TargetQuantity as TargetQuantity,
      src.OrderUnit as OrderUnit,
      src.NetPrice as NetPrice,
      src.PriceUnit as PriceUnit,
      src.DeletionFlag as DeletionFlag
}
