// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DeliveryMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_DeliveryMig
  as select from ZSDX_I_Delivery as src
{
  key src.DeliveryDocument as DeliveryDocument,
      src.DeliveryDocumentType as DeliveryDocumentType,
      src.ShippingPoint as ShippingPoint,
      src.ShipToParty as ShipToParty,
      src.PlannedGoodsIssueDate as PlannedGoodsIssueDate,
      src.ActualGoodsIssueDate as ActualGoodsIssueDate
}
