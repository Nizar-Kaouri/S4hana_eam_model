// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per material document item: movement type, debit/credit indicator, quantity in base unit,
//   value in company code currency and the account assignment (cost center, order, purchase order).
// Example: Goods issues to maintenance orders; goods receipts per supplier and month.
// TODO-VERIFY[M] MM-020: I_MaterialDocumentItem_2 exists, is released with keys MaterialDocumentYear, MaterialDocument, MaterialDocumentItem
// TODO-VERIFY[M] MM-021: elements GoodsMovementType, DebitCreditCode ('S' receipt / 'H' issue), QuantityInBaseUnit, MaterialBaseUnit, TotalGoodsMvtAmtInCCCrcy
// TODO-VERIFY[H] MM-022: account assignment elements CostCenter, OrderID, Reservation, ReservationItem, PurchaseOrder, PurchaseOrderItem, Supplier, Customer
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Goods Movement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaterialDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #XXL,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZMMV_I_GoodsMovement
  as select from I_MaterialDocumentItem_2
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      StorageLocation,
      Batch,
      GoodsMovementType,
      DebitCreditCode,
      PostingDate,
      DocumentDate,
      CompanyCode,
      MaterialBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      QuantityInBaseUnit,
      CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      TotalGoodsMvtAmtInCCCrcy,
      CostCenter,
      OrderID,
      Reservation,
      ReservationItem,
      PurchaseOrder,
      PurchaseOrderItem,
      Supplier,
      Customer,

      /* Associations */
      _Plant
}
