// ZEMT EAM migration - S/4HANA reconciliation - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of work centers on S/4HANA per Plant, WorkCenterCategoryCode; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module work_center --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_R_WorkCenterCount
  as select from I_WorkCenter
{
  key Plant                  as Plant,
  key WorkCenterCategoryCode as WorkCenterCategoryCode,
      count( * )             as RecordCount
}
where WorkCenterTypeCode = 'A'
group by Plant, WorkCenterCategoryCode
