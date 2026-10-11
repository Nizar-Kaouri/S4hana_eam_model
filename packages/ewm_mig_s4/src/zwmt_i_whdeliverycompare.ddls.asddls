// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.
// Purpose: Read WhDeliveryCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WhDeliveryCompare
  as select from /scdl/db_proch_i as src
{
  key src.docid as DeliveryUUID,
      src.docno as Delivery,
      src.doctype as DeliveryType,
      src.doccat as DeliveryCategory,
      src.inco1 as Incoterms,
      src.inco2 as IncotermsLocation,
      src.creuser as CreatedBy,
      src.cretst as CreatedAt
}
