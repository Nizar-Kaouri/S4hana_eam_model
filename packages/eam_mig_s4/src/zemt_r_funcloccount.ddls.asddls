// ZEMT EAM migration - S/4HANA reconciliation - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of functional locations on S/4HANA per MaintenancePlanningPlant, FunctionalLocationCategory; same structure as the ECC count view.
// Example: Export after the load: python3 tools/mig_reconcile.py counts --module functional_location --source <ECC export> --target <this export>.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location count (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #S,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEMT_R_FuncLocCount
  as select from I_FunctionalLocation
{
  key MaintenancePlanningPlant   as MaintenancePlanningPlant,
  key FunctionalLocationCategory as FunctionalLocationCategory,
      count( * )                 as RecordCount
}
group by MaintenancePlanningPlant, FunctionalLocationCategory
