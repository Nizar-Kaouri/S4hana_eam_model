// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.
// Purpose: Read FreightUnitItem as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_FreightUnitItem
  as select from ZTMX_B_FreightUnitIteData as src
    inner join ZTMX_B_FreightUnitData as parent
      on src.DocumentUUID = parent.DocumentUUID
{
  key src.ItemUUID as ItemUUID,
      src.DocumentUUID as DocumentUUID,
      src.ItemID as ItemID,
      src.ItemCategory as ItemCategory,
      src.ItemType as ItemType
}
where parent.DocumentCategory = 'FU'
