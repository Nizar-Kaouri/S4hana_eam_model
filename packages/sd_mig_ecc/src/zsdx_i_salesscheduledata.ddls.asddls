// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesScheduleData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesScheduleData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesScheduleData
  as select from vbep as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
  key src.etenr as ScheduleLine,
      src.edatu as DeliveryDate,
      src.wmeng as OrderQuantity,
      src.bmeng as ConfirmedQuantity
}
