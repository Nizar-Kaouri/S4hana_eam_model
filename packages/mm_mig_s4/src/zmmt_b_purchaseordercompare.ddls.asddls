// ModuPorter MM migration | Release 1.0.0
// Purpose: Read PurchaseOrderCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PurchaseOrderCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZMMT_B_PurchaseOrderCompare
  as select from I_PurchaseOrderAPI01 as src
{
  key src.PurchaseOrder as PurchaseOrder,
      src.CompanyCode as CompanyCode,
      src.PurchaseOrderType as PurchaseOrderType,
      src.Supplier as Supplier,
      src.PurchasingOrganization as PurchasingOrganization,
      src.PurchasingGroup as PurchasingGroup,
      src.DocumentCurrency as DocumentCurrency
}
