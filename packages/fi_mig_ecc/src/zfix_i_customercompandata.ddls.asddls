// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CustomerCompanData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FIX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerCompanData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_CustomerCompanData
  as select from knb1 as src
{
  key src.kunnr as Customer,
  key src.bukrs as CompanyCode,
      src.akont as ReconciliationAccount,
      src.zterm as PaymentTerms,
      src.zwels as PaymentMethods,
      src.loevm as DeletionFlag
}
