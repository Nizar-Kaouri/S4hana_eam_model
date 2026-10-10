// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightAgreeMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightAgreeMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightAgreeMig
  as select from ZTMX_I_FreightAgree as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.AgreementID as AgreementID,
  key src.Version as Version,
      src.AgreementType as AgreementType,
      src.Carrier as Carrier,
      src.Currency as Currency,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate,
      src.ReleaseStatus as ReleaseStatus
}
