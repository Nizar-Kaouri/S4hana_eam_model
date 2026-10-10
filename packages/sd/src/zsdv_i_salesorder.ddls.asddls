// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per sales order (document category C): order type, sales area, sold-to party, dates, customer
//   reference, net value, overall processing / delivery / billing status and a derived open flag.
// Example: Open sales orders per sales organization; order intake per sold-to party.
// TODO-VERIFY[M] SD-001: I_SalesDocument is released with key SalesDocument and element SDDocumentCategory ('C' = order)
// TODO-VERIFY[M] SD-002: status elements OverallSDProcessStatus, OverallTotalDeliveryStatus, OverallOrdReltdBillgStatus ('C' = completely processed)
// TODO-VERIFY[M] SD-003: elements OrganizationDivision, RequestedDeliveryDate, PurchaseOrderByCustomer, TotalNetAmount, TransactionCurrency
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Sales Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'SalesDocument'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZSDV_I_SalesOrder
  as select from I_SalesDocument
  association [0..1] to I_Customer as _SoldToParty on $projection.SoldToParty = _SoldToParty.Customer
{
  key SalesDocument,
      SalesDocumentType,
      SalesOrganization,
      DistributionChannel,
      OrganizationDivision,
      @ObjectModel.foreignKey.association: '_SoldToParty'
      SoldToParty,
      SalesDocumentDate,
      CreationDate,
      RequestedDeliveryDate,
      PurchaseOrderByCustomer,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalNetAmount,
      OverallSDProcessStatus,
      OverallTotalDeliveryStatus,
      OverallOrdReltdBillgStatus,
      @EndUserText.label: 'Sales Order Is Open'
      cast( case when OverallSDProcessStatus <> 'C' then 'X' else ' ' end as abap_boolean ) as SalesOrderIsOpen,

      /* Associations */
      _SoldToParty
}
where
  SDDocumentCategory = 'C'
