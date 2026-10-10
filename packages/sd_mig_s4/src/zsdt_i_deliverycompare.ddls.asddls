// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DeliveryCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDT-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZSDT_I_DeliveryCompare
  as select from I_DeliveryDocument as src
{
  key src.DeliveryDocument as DeliveryDocument,
      src.DeliveryDocumentType as DeliveryDocumentType,
      src.ShippingPoint as ShippingPoint,
      src.ShipToParty as ShipToParty
}
