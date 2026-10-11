// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.
// Purpose: Read WhDeliveryData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_WhDeliveryData
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
