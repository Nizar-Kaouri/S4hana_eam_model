// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.
// Purpose: Read FreightOrdItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V015C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrdItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightOrdItemMig
  as select from ZTMX_I_FreightOrdItem as src
{
  key src.ItemUUID as ItemUUID,
      src.DocumentUUID as DocumentUUID,
      src.ItemID as ItemID,
      src.ItemCategory as ItemCategory,
      src.ItemType as ItemType
}
