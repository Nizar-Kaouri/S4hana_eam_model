// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read GLCompany as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLCompany'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_GLCompany
  as select from ZFIX_I_GLCompanyData as src
{
  key src.CompanyCode as CompanyCode,
  key src.GLAccount as GLAccount,
      src.AccountCurrency as AccountCurrency,
      src.OpenItemManagement as OpenItemManagement,
      src.DeletionFlag as DeletionFlag
}
