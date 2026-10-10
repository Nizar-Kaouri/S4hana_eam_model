// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Internal order cube: number of (open) internal orders per order type, company code and responsible
//   cost center.
// Example: Open internal orders per order type.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Internal Order - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZCOV_R_InternalOrder
  as select from ZCOV_I_InternalOrder
  association [1..1] to ZCOV_I_InternalOrder as _InternalOrder on $projection.InternalOrder = _InternalOrder.InternalOrder
{
      @ObjectModel.foreignKey.association: '_InternalOrder'
  key InternalOrder,
      OrderType,
      ControllingArea,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      ResponsibleCostCenter,
      ProfitCenter,
      OrderIsReleased,
      OrderIsClosed,
      CreationDate,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Internal Orders'
      cast( 1 as abap.int4 ) as NumberOfInternalOrders,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Internal Orders'
      cast( case when OrderIsClosed = '' then 1 else 0 end as abap.int4 ) as NumberOfOpenInternalOrders,

      /* Associations */
      _CompanyCode,
      _InternalOrder
}
