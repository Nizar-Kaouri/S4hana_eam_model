// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per billing document: type, document category (invoice, credit memo, cancellation), date,
//   sold-to party, payer, sales area, company code, net value, cancellation flag and accounting document.
// Example: Revenue per sales organization and month; cancelled invoices.
// TODO-VERIFY[M] SD-020: I_BillingDocument elements SDDocumentCategory, PayerParty, BillingDocumentIsCancelled, AccountingDocument
// TODO-VERIFY[M] SD-021: credit memo categories 'O' (credit memo) and 'N' (invoice cancellation) are posted with negative revenue sign
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Billing Document'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'BillingDocument'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZSDV_I_BillingDocument
  as select from I_BillingDocument
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
  key BillingDocument,
      BillingDocumentType,
      SDDocumentCategory,
      BillingDocumentDate,
      SoldToParty,
      PayerParty,
      SalesOrganization,
      DistributionChannel,
      Division,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      TransactionCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      TotalNetAmount,
      BillingDocumentIsCancelled,
      AccountingDocument,

      /* Associations */
      _CompanyCode
}
