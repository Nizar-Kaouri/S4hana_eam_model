// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Financial dispute attributes; amount payload, item relations and attachments remain pending.
// Purpose: Read DisputeCase as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V011R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DisputeCase'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFCX_I_DisputeCase
  as select from ZFCX_I_DisputeCaseData as src
{
  key src.CaseUUID as CaseUUID,
      src.CompanyCode as CompanyCode,
      src.Customer as Customer,
      src.Coordinator as Coordinator,
      src.DisputeCurrency as DisputeCurrency,
      src.DueDate as DueDate,
      src.LogicalSystem as LogicalSystem
}
