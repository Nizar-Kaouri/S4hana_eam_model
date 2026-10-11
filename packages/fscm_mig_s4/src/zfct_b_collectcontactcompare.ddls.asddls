// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Contact attributes only; associated items and resubmissions remain pending.
// Purpose: Read CollectContactCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectContactCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_B_CollectContactCompare
  as select from udm_cct_attr as src
{
  key src.cct_guid as ContactUUID,
      src.cct_date as ContactDate,
      src.cct_result as ContactResult,
      src.cct_type as ContactType,
      src.cct_direction as ContactDirection,
      src.xreached as Reached,
      src.coll_segment as CollectionSegment,
      src.coll_specialist as CollectionSpecialist,
      src.customer as BusinessPartner,
      src.cct_name as ContactName,
      src.changed_at as ChangedAt
}
