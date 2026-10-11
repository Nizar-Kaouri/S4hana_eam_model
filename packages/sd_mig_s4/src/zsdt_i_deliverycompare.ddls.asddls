// ModuPorter SD migration | Release 1.0.0
// Purpose: Read DeliveryCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
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
