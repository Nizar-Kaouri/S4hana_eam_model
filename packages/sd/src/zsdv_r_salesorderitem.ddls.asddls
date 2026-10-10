// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Sales order item cube: order value, quantity and number of (open) items per sales area, sold-to
//   party, material and plant.
// Example: Order intake per sales organization and month; open order value per customer.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Sales Order Item - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZSDV_R_SalesOrderItem
  as select from ZSDV_I_SalesOrderItem
{
      @ObjectModel.foreignKey.association: '_SalesOrder'
  key SalesDocument,
  key SalesDocumentItem,
      SalesDocumentItemCategory,
      Material,
      MaterialGroup,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      OrderQuantityUnit,
      TransactionCurrency,
      SDProcessStatus,
      SalesDocumentRjcnReason,
      SalesOrderItemIsOpen,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Order Value'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Items'
      cast( 1 as abap.int4 ) as NumberOfItems,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Items'
      cast( case when SalesOrderItemIsOpen = 'X' then 1 else 0 end as abap.int4 ) as NumberOfOpenItems,

      /* Order header characteristics */
      _SalesOrder.SalesDocumentType,
      _SalesOrder.SalesOrganization,
      _SalesOrder.DistributionChannel,
      _SalesOrder.OrganizationDivision,
      _SalesOrder.SoldToParty,
      _SalesOrder.SalesDocumentDate,

      /* Associations */
      _SalesOrder,
      _Plant
}
