// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402
// Purpose: Read FreightOrder as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V014R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrder'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_FreightOrder
  as select from ZTMX_I_FreightOrderData as src
{
  key src.DocumentUUID as DocumentUUID,
      src.DocumentID as DocumentID,
      src.DocumentCategory as DocumentCategory,
      src.DocumentType as DocumentType,
      src.LifecycleStatus as LifecycleStatus
}
