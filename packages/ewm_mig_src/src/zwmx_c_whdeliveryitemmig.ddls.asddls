// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending.
// Purpose: Read WhDeliveryItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_WhDeliveryItemMig
  as select from ZWMX_I_WhDeliveryItem as src
{
  key src.DeliveryUUID as DeliveryUUID,
  key src.DeliveryItemUUID as DeliveryItemUUID,
      src.DeliveryItem as DeliveryItem,
      src.ItemType as ItemType,
      src.ItemCategory as ItemCategory,
      src.ProductUUID as ProductUUID,
      src.Product as Product,
      src.EnteredProduct as EnteredProduct,
      src.Priority as Priority,
      src.Batch as Batch,
      src.StockUsage as StockUsage,
      src.StockCategory as StockCategory,
      src.StockOwner as StockOwner,
      src.StockOwnerRole as StockOwnerRole,
      src.EntitledParty as EntitledParty,
      src.EntitledPartyRole as EntitledPartyRole,
      src.Warehouse as Warehouse
}
