// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesPartnerData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesPartnerData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_SalesPartnerData
  as select from vbpa as src
{
  key src.vbeln as SalesDocument,
  key src.posnr as SalesDocumentItem,
  key src.parvw as PartnerFunction,
      src.kunnr as Customer,
      src.lifnr as Supplier,
      src.pernr as PersonnelNumber
}
