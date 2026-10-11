// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open sales order items: open value, quantity, number of items, items past the requested delivery
//   date, order age and age bucket per sales area and customer.
// Example: Order backlog per sales organization; customers with overdue orders.
// Open value = full item value of open items (partially delivered or billed quantities are not deducted yet).
// TODO-VERIFY[M] SD-R02: open value without deducting delivered / billed quantities - confirm acceptable for the first version
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Open Sales Order Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZSDV_I_OpenSalesOrder
  as select from ZSDV_B_SalesOrderItem
{
      @ObjectModel.foreignKey.association: '_SalesOrder'
  key SalesDocument,
  key SalesDocumentItem,
      Material,
      MaterialGroup,
      Plant,
      OrderQuantityUnit,
      TransactionCurrency,
      @EndUserText.label: 'Order Age Bucket'
      cast( case when dats_days_between( _SalesOrder.SalesDocumentDate, $session.system_date ) <= 30 then '1: 0-30'
                 when dats_days_between( _SalesOrder.SalesDocumentDate, $session.system_date ) <= 90 then '2: 31-90'
                 when dats_days_between( _SalesOrder.SalesDocumentDate, $session.system_date ) <= 180 then '3: 91-180'
                 else '4: >180' end as abap.char( 10 ) ) as OrderAgeBucket,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Order Value'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Items'
      cast( 1 as abap.int4 ) as NumberOfOpenItems,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Items Past Requested Delivery'
      cast( case when _SalesOrder.RequestedDeliveryDate < $session.system_date then 1 else 0 end as abap.int4 ) as NumberOfOverdueItems,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Order Age (Days)'
      dats_days_between( _SalesOrder.SalesDocumentDate, $session.system_date ) as OrderAgeInDays,

      /* Order header characteristics */
      _SalesOrder.SalesDocumentType,
      _SalesOrder.SalesOrganization,
      _SalesOrder.DistributionChannel,
      _SalesOrder.SoldToParty,
      _SalesOrder.SalesDocumentDate,
      _SalesOrder.RequestedDeliveryDate,

      /* Associations */
      _SalesOrder
}
where
  SalesOrderItemIsOpen = 'X'
