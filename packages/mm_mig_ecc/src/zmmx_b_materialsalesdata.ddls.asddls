// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_85N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialSalesData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_MaterialSalesData
  as select from mvke as src
{
  key src.matnr as Product,
  key src.vkorg as SalesOrganization,
  key src.vtweg as DistributionChannel,
      src.vrkme as SalesUnit,
      src.dwerk as DeliveringPlant,
      src.vmsta as SalesStatus,
      src.vmstd as SalesStatusValidFrom,
      src.mtpos as ItemCategoryGroup,
      src.ktgrm as AccountAssignmentGroup,
      src.lvorm as DeletionFlag
}
