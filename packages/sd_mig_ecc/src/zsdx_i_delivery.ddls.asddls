// ModuPorter SD migration | Release 1.0.0
// Purpose: Read Delivery as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Delivery'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_Delivery
  as select from ZSDX_I_DeliveryData as src
{
  key src.DeliveryDocument as DeliveryDocument,
      src.DeliveryDocumentType as DeliveryDocumentType,
      src.ShippingPoint as ShippingPoint,
      src.ShipToParty as ShipToParty,
      src.PlannedGoodsIssueDate as PlannedGoodsIssueDate,
      src.ActualGoodsIssueDate as ActualGoodsIssueDate
}
