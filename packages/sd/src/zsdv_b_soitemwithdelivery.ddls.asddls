// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Sales order item with a to-many association to the delivery items that reference it.
// Example: Document flow order → delivery in an order item object page.
// LINK VIEW (ships only when modules "outbound_delivery" AND "sales_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Sales Order Item with Deliveries'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SalesDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZSDV_B_SOItemWithDelivery
  as select from ZSDV_B_SalesOrderItem
  association [0..*] to ZSDV_B_DeliveryItem as _DeliveryItem on $projection.SalesDocument = _DeliveryItem.ReferenceSDDocument
    and $projection.SalesDocumentItem = _DeliveryItem.ReferenceSDDocumentItem
{
  key SalesDocument,
  key SalesDocumentItem,
      Material,
      Plant,
      SalesOrderItemIsOpen,

      /* Associations */
      _DeliveryItem
}
