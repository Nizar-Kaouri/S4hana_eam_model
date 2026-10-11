// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesScheduleMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V003C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesScheduleMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesScheduleMig
  as select from ZSDX_I_SalesSchedule as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
  key src.ScheduleLine as ScheduleLine,
      src.DeliveryDate as DeliveryDate,
      src.OrderQuantity as OrderQuantity,
      src.ConfirmedQuantity as ConfirmedQuantity
}
