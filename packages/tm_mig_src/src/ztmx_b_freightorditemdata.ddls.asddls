// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.
// Purpose: Read FreightOrdItemData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-015: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V015'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrdItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_B_FreightOrdItemData
  as select from /scmtms/d_torite as src
{
  key src.db_key as ItemUUID,
      src.parent_key as DocumentUUID,
      src.item_id as ItemID,
      src.item_cat as ItemCategory,
      src.item_type as ItemType
}
