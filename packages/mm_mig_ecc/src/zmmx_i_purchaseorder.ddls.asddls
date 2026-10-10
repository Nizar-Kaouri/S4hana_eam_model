// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PurchaseOrder as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V017R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseOrder'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_PurchaseOrder
  as select from ZMMX_I_PurchaseOrderData as src
{
  key src.PurchaseOrder as PurchaseOrder,
      src.CompanyCode as CompanyCode,
      src.PurchaseOrderType as PurchaseOrderType,
      src.Supplier as Supplier,
      src.PurchasingOrganization as PurchasingOrganization,
      src.PurchasingGroup as PurchasingGroup,
      src.DocumentCurrency as DocumentCurrency
}
