// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MatDocHeaderMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MatDocHeaderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MatDocHeaderMig
  as select from ZMMX_I_MatDocHeader as src
{
  key src.MaterialDocument as MaterialDocument,
  key src.MaterialDocumentYear as MaterialDocumentYear,
      src.DocumentDate as DocumentDate,
      src.PostingDate as PostingDate,
      src.ReferenceDocument as ReferenceDocument
}
