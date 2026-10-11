// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLCompanyData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLCompanyData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_GLCompanyData
  as select from skb1 as src
{
  key src.bukrs as CompanyCode,
  key src.saknr as GLAccount,
      src.waers as AccountCurrency,
      src.xopvw as OpenItemManagement,
      src.xloeb as DeletionFlag
}
