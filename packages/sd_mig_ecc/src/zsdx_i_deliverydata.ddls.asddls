// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DeliveryData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZSDX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_I_DeliveryData
  as select from likp as src
{
  key src.vbeln as DeliveryDocument,
      src.lfart as DeliveryDocumentType,
      src.vstel as ShippingPoint,
      src.kunnr as ShipToParty,
      src.wadat as PlannedGoodsIssueDate,
      src.wadat_ist as ActualGoodsIssueDate
}
