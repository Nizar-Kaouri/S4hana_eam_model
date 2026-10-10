// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Sales order item with a to-many association to the billing items that reference it.
// Example: Billed value per order item; orders not yet billed.
// LINK VIEW (ships only when modules "billing_document" AND "sales_order" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Sales Order Item with Billing Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SalesDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZSDV_I_SOItemWithBilling
  as select from ZSDV_I_SalesOrderItem
  association [0..*] to ZSDV_I_BillingDocumentItem as _BillingItem on $projection.SalesDocument = _BillingItem.SalesDocument
    and $projection.SalesDocumentItem = _BillingItem.SalesDocumentItem
{
  key SalesDocument,
  key SalesDocumentItem,
      Material,
      Plant,
      SalesOrderItemIsOpen,

      /* Associations */
      _BillingItem
}
