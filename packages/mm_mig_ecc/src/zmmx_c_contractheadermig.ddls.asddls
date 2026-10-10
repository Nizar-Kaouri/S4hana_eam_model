// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ContractHeaderMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V024C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractHeaderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_ContractHeaderMig
  as select from ZMMX_I_ContractHeader as src
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
