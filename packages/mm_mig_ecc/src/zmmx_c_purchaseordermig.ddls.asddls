// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseOrderMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V017C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseOrderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_PurchaseOrderMig
  as select from ZMMX_I_PurchaseOrder as src
{
  key src.PurchaseOrder as PurchaseOrder,
      src.CompanyCode as CompanyCode,
      src.PurchaseOrderType as PurchaseOrderType,
      src.Supplier as Supplier,
      src.PurchasingOrganization as PurchasingOrganization,
      src.PurchasingGroup as PurchasingGroup,
      src.DocumentCurrency as DocumentCurrency
}
