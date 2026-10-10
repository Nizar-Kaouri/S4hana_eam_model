// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DeliveryItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_DeliveryItemMig
  as select from ZSDX_I_DeliveryItem as src
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
