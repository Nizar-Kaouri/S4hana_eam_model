// ModuPorter SD migration | Release 1.0.0
// Purpose: Read DeliveryItem as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_DeliveryItem
  as select from ZSDX_I_DeliveryItemData as src
{
  key src.DeliveryDocument as DeliveryDocument,
  key src.DeliveryDocumentItem as DeliveryDocumentItem,
      src.Material as Material,
      src.Plant as Plant,
      src.StorageLocation as StorageLocation,
      src.DeliveryQuantity as DeliveryQuantity,
      src.SalesUnit as SalesUnit,
      src.ReferenceDocument as ReferenceDocument,
      src.ReferenceDocumentItem as ReferenceDocumentItem
}
