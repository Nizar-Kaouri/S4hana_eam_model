// ModuPorter SD migration | Release 1.0.0
// Purpose: Read DeliveryItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V010'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_DeliveryItemData
  as select from lips as src
{
  key src.vbeln as DeliveryDocument,
  key src.posnr as DeliveryDocumentItem,
      src.matnr as Material,
      src.werks as Plant,
      src.lgort as StorageLocation,
      src.lfimg as DeliveryQuantity,
      src.vrkme as SalesUnit,
      src.vgbel as ReferenceDocument,
      src.vgpos as ReferenceDocumentItem
}
