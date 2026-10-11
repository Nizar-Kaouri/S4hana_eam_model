// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending.
// Purpose: Read WhDeliveryItemData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-013: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V013'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_WhDeliveryItemData
  as select from /scdl/db_proci_i as src
{
  key src.docid as DeliveryUUID,
  key src.itemid as DeliveryItemUUID,
      src.itemno as DeliveryItem,
      src.itemtype as ItemType,
      src.itemcat as ItemCategory,
      src.productid as ProductUUID,
      src.productno as Product,
      src.productent as EnteredProduct,
      src.priority as Priority,
      src.batchno as Batch,
      src.stock_usage as StockUsage,
      src.stock_category as StockCategory,
      src.stock_owner as StockOwner,
      src.stock_owner_role as StockOwnerRole,
      src.entitled as EntitledParty,
      src.entitled_role as EntitledPartyRole,
      src.lgnum as Warehouse
}
