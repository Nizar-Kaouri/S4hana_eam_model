// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_87N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'MaterialSalesMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MaterialSalesMig
  as select from ZMMX_I_MaterialSales as src
{
  key src.Product as Product,
  key src.SalesOrganization as SalesOrganization,
  key src.DistributionChannel as DistributionChannel,
      src.SalesUnit as SalesUnit,
      src.DeliveringPlant as DeliveringPlant,
      src.SalesStatus as SalesStatus,
      src.SalesStatusValidFrom as SalesStatusValidFrom,
      src.ItemCategoryGroup as ItemCategoryGroup,
      src.AccountAssignmentGroup as AccountAssignmentGroup,
      src.DeletionFlag as DeletionFlag
}
