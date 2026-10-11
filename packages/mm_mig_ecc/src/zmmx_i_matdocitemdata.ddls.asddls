// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MatDocItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MatDocItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_MatDocItemData
  as select from mseg as src
{
  key src.mblnr as MaterialDocument,
  key src.mjahr as MaterialDocumentYear,
  key src.zeile as MaterialDocumentItem,
      src.matnr as Product,
      src.werks as Plant,
      src.lgort as StorageLocation,
      src.bwart as GoodsMovementType,
      src.menge as Quantity,
      src.meins as Unit,
      src.dmbtr as LocalAmount,
      src.shkzg as DebitCreditCode
}
