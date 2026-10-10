// ZEMT EAM migration - S/4HANA reconciliation - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work center on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module work_center ...
// TODO-VERIFY[M] TWC-001: I_WorkCenter elements WorkCenter, Plant, WorkCenterCategoryCode, WorkCenterResponsible, ValidityStartDate (same as packages/eam WC items)
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'Plant'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEMT_I_WorkCenterCompare
  as select from I_WorkCenter
{
  key WorkCenter             as WorkCenter,
  key Plant                  as Plant,
      WorkCenterCategoryCode as WorkCenterCategoryCode,
      WorkCenterResponsible  as WorkCenterResponsible,
      ValidityStartDate      as ValidityStartDate
}
where WorkCenterTypeCode = 'A'
