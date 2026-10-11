// ModuPorter MM migration | Release 1.0.0
// Purpose: Read ContractHeader as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V024R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractHeader'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_ContractHeader
  as select from ZMMX_B_ContractHeaderData as src
{
  key src.PurchasingContract as PurchasingContract,
      src.PurchasingDocumentCategory as PurchasingDocumentCategory,
      src.ContractType as ContractType,
      src.CompanyCode as CompanyCode,
      src.Supplier as Supplier,
      src.PurchasingOrganization as PurchasingOrganization,
      src.PurchasingGroup as PurchasingGroup,
      src.Currency as Currency,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
