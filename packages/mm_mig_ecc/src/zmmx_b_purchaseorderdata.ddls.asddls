// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseOrderData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V017'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseOrderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_PurchaseOrderData
  as select from ekko as src
{
  key src.ebeln as PurchaseOrder,
      src.bukrs as CompanyCode,
      src.bsart as PurchaseOrderType,
      src.lifnr as Supplier,
      src.ekorg as PurchasingOrganization,
      src.ekgrp as PurchasingGroup,
      src.waers as DocumentCurrency
}
