// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open purchase order items: open value, number of open items, order age and age bucket per supplier
//   and purchasing group.
// Example: Purchase orders older than 90 days that are still not delivered, per supplier.
// Open value = full item net value (partial deliveries are not deducted; goods receipt quantities are a later refinement).
// TODO-VERIFY[M] MM-R02: open value without deducting partial goods receipts - confirm acceptable for the first version
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Open Purchase Order Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZMMV_I_OpenPurchaseOrder
  as select from ZMMV_B_PurchaseOrderItem
{
      @ObjectModel.foreignKey.association: '_PurchaseOrder'
  key PurchaseOrder,
  key PurchaseOrderItem,
      Material,
      MaterialGroup,
      Plant,
      AccountAssignmentCategory,
      PurchaseOrderQuantityUnit,
      DocumentCurrency,
      @EndUserText.label: 'Order Age Bucket'
      cast( case when dats_days_between( _PurchaseOrder.PurchaseOrderDate, $session.system_date ) <= 30 then '1: 0-30'
                 when dats_days_between( _PurchaseOrder.PurchaseOrderDate, $session.system_date ) <= 90 then '2: 31-90'
                 when dats_days_between( _PurchaseOrder.PurchaseOrderDate, $session.system_date ) <= 180 then '3: 91-180'
                 else '4: >180' end as abap.char( 10 ) ) as OrderAgeBucket,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PurchaseOrderQuantityUnit'
      OrderQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Order Value'
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      NetAmount,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Open Items'
      cast( 1 as abap.int4 ) as NumberOfOpenItems,
      @Aggregation.default: #MAX
      @EndUserText.label: 'Order Age (Days)'
      dats_days_between( _PurchaseOrder.PurchaseOrderDate, $session.system_date ) as OrderAgeInDays,

      /* Order header characteristics */
      _PurchaseOrder.Supplier,
      _PurchaseOrder.PurchasingOrganization,
      _PurchaseOrder.PurchasingGroup,
      _PurchaseOrder.CompanyCode,
      _PurchaseOrder.PurchaseOrderDate,

      /* Associations */
      _PurchaseOrder
}
where
  PurchaseOrderItemIsOpen = 'X'
