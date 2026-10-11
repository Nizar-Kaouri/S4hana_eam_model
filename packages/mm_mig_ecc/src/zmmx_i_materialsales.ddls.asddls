// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_86N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialSales'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialSales
  as select from ZMMX_B_MaterialSalesData as ch
    inner join ZMMX_I_Material as obj on ch.Product = obj.Product
{
  key ch.Product as Product,
  key ch.SalesOrganization as SalesOrganization,
  key ch.DistributionChannel as DistributionChannel,
      ch.SalesUnit as SalesUnit,
      ch.DeliveringPlant as DeliveringPlant,
      ch.SalesStatus as SalesStatus,
      ch.SalesStatusValidFrom as SalesStatusValidFrom,
      ch.ItemCategoryGroup as ItemCategoryGroup,
      ch.AccountAssignmentGroup as AccountAssignmentGroup,
      ch.DeletionFlag as DeletionFlag
}
