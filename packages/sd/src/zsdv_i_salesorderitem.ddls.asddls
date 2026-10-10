// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per sales order item: item category, material, material group, plant, order quantity, net
//   value, processing status, rejection reason and a derived open flag.
// Example: Order value per material group; open items per plant.
// TODO-VERIFY[M] SD-004: I_SalesDocumentItem elements Material, MaterialGroup, Plant, OrderQuantity, OrderQuantityUnit, NetAmount, SDProcessStatus, SalesDocumentRjcnReason
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Sales Order Item'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SalesDocumentItem'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZSDV_I_SalesOrderItem
  as select from I_SalesDocumentItem
  association [1..1] to ZSDV_I_SalesOrder as _SalesOrder on $projection.SalesDocument = _SalesOrder.SalesDocument
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
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
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      OrderQuantity,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      NetAmount,
      SDProcessStatus,
      SalesDocumentRjcnReason,
      @EndUserText.label: 'Item Is Open'
      cast( case when SDProcessStatus <> 'C' and SalesDocumentRjcnReason = '' then 'X' else ' ' end as abap_boolean ) as SalesOrderItemIsOpen,

      /* Associations */
      _SalesOrder,
      _Plant
}
where
  SDDocumentCategory = 'C'
