// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per purchase order header: type, supplier, purchasing organization and group, company code,
//   order date, currency and processing status; dimension for the item cube.
// Example: Purchase orders per supplier and purchasing group; order header attributes in item analyses.
// TODO-VERIFY[M] MM-040: SAP released view is I_PurchaseOrderAPI01 with key PurchaseOrder
// TODO-VERIFY[M] MM-041: elements PurchaseOrderType, Supplier, PurchasingOrganization, PurchasingGroup, PurchaseOrderDate, DocumentCurrency
// TODO-VERIFY[M] MM-042: processing status element PurchasingProcessingStatus
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Purchase Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'PurchaseOrder'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZMMV_B_PurchaseOrder
  as select from I_PurchaseOrderAPI01
  association [0..1] to I_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
  key PurchaseOrder,
      PurchaseOrderType,
      @ObjectModel.foreignKey.association: '_Supplier'
      Supplier,
      PurchasingOrganization,
      PurchasingGroup,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      PurchaseOrderDate,
      DocumentCurrency,
      PurchasingProcessingStatus,
      CreationDate,
      CreatedByUser,

      /* Associations */
      _Supplier,
      _CompanyCode
}
