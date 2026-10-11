// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per internal order: description, order type, controlling area, company code, responsible cost
//   center, profit center, released / closed flags and creation date.
// Example: Open internal orders per order type; marketing orders per responsible cost center.
// TODO-VERIFY[H] CO-010: SAP released view for internal orders is I_InternalOrder (name not confirmed)
// TODO-VERIFY[H] CO-011: elements InternalOrderDescription, OrderType, ResponsibleCostCenter, OrderIsReleased, OrderIsClosed
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Internal Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'InternalOrder'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZCOV_B_InternalOrder
  as select from I_InternalOrder
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
      @ObjectModel.text.element: [ 'InternalOrderDescription' ]
  key InternalOrder,
      @Semantics.text: true
      InternalOrderDescription,
      OrderType,
      ControllingArea,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      ResponsibleCostCenter,
      ProfitCenter,
      OrderIsReleased,
      OrderIsClosed,
      CreationDate,

      /* Associations */
      _CompanyCode
}
