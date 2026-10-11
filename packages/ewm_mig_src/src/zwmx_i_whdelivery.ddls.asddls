// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.
// Purpose: Read WhDelivery as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDelivery'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_WhDelivery
  as select from ZWMX_I_WhDeliveryData as src
{
  key src.DeliveryUUID as DeliveryUUID,
      src.Delivery as Delivery,
      src.DeliveryType as DeliveryType,
      src.DeliveryCategory as DeliveryCategory,
      src.Incoterms as Incoterms,
      src.IncotermsLocation as IncotermsLocation,
      src.CreatedBy as CreatedBy,
      src.CreatedAt as CreatedAt
}
