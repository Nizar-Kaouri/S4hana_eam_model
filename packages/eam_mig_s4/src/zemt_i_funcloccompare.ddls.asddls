// ModuPorter EAM migration | Release 1.0.0
// Purpose: Functional location on S/4HANA with the business key and the fields compared after the load; element names equal the ECC extract so that tools/mig_reconcile.py compares them by name.
// Example: Export this view after the load and compare it with the ECC extract: python3 tools/mig_reconcile.py fields --module functional_location ...
// Compatibility note: I_FunctionalLocation elements as in packages/eam (FL items); FunctionalLocation is the internal key that equals the label without alternative labeling
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location compare (reconciliation)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE, #EXTRACTION_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #D,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZEMT_I_FuncLocCompare
  as select from I_FunctionalLocation
{
  key FunctionalLocation         as FunctionalLocation,
      FunctionalLocationCategory as FunctionalLocationCategory,
      SuperiorFunctionalLocation as SuperiorFunctionalLocation,
      TechnicalObjectType        as TechnicalObjectType,
      MaintenancePlanningPlant   as MaintenancePlanningPlant,
      MaintenancePlant           as MaintenancePlant,
      ABCIndicator               as ABCIndicator,
      CompanyCode                as CompanyCode,
      CostCenter                 as CostCenter
}
