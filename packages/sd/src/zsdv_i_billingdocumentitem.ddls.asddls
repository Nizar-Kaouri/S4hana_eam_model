// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per billing item: material, material group, plant, billed quantity, net value, reference
//   sales order item and profit center.
// Example: Revenue per material group and profit center.
// TODO-VERIFY[M] SD-022: I_BillingDocumentItem elements BillingQuantity, BillingQuantityUnit, NetAmount, SalesDocument, SalesDocumentItem, ProfitCenter
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Billing Document Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BillingDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZSDV_I_BillingDocumentItem
  as select from I_BillingDocumentItem
  association [1..1] to ZSDV_I_BillingDocument as _BillingDocument on $projection.BillingDocument = _BillingDocument.BillingDocument
{
      @ObjectModel.foreignKey.association: '_BillingDocument'
  key BillingDocument,
  key BillingDocumentItem,
      Material,
      MaterialGroup,
      Plant,
      BillingQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'BillingQuantityUnit'
      BillingQuantity,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      SalesDocument,
      SalesDocumentItem,
      ProfitCenter,

      /* Associations */
      _BillingDocument
}
