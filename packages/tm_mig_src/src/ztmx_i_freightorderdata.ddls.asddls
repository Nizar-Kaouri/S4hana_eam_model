// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402
// Purpose: Read FreightOrderData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightOrderData
  as select from /scmtms/d_torrot as src
{
  key src.db_key as DocumentUUID,
      src.tor_id as DocumentID,
      src.tor_cat as DocumentCategory,
      src.tor_type as DocumentType,
      src.lifecycle as LifecycleStatus
}
