// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MatDocItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V014C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MatDocItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MatDocItemMig
  as select from ZMMX_I_MatDocItem as src
{
  key src.MaterialDocument as MaterialDocument,
  key src.MaterialDocumentYear as MaterialDocumentYear,
  key src.MaterialDocumentItem as MaterialDocumentItem,
      src.Product as Product,
      src.Plant as Plant,
      src.StorageLocation as StorageLocation,
      src.GoodsMovementType as GoodsMovementType,
      src.Quantity as Quantity,
      src.Unit as Unit,
      src.LocalAmount as LocalAmount,
      src.DebitCreditCode as DebitCreditCode
}
