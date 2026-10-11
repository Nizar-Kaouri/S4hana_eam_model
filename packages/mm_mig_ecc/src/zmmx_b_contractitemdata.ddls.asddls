// ModuPorter MM migration | Release 1.0.0
// Purpose: Read ContractItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V025'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_ContractItemData
  as select from ekpo as src
{
  key src.ebeln as PurchasingContract,
  key src.ebelp as PurchasingContractItem,
      src.matnr as Product,
      src.werks as Plant,
      src.ktmng as TargetQuantity,
      src.meins as OrderUnit,
      src.netpr as NetPrice,
      src.peinh as PriceUnit,
      src.loekz as DeletionFlag
}
