// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.
// Purpose: Read FreightUnitItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V012C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightUnitItemMig
  as select from ZTMX_I_FreightUnitItem as src
{
  key src.ItemUUID as ItemUUID,
      src.DocumentUUID as DocumentUUID,
      src.ItemID as ItemID,
      src.ItemCategory as ItemCategory,
      src.ItemType as ItemType
}
