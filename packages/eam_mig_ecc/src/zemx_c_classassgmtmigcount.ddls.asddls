// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the class assignments delivered by ZEMX_C_ClassAssignmentMig per ClassType, Class; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every ClassType / Class combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CCLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Class assignment count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_ClassAssgmtMigCount
  as select from ZEMX_C_ClassAssignmentMig
{
      @EndUserText.label: 'Class Type'
  key ClassType  as ClassType,
      @EndUserText.label: 'Class'
  key Class      as Class,
      @EndUserText.label: 'Record Count'
      count( * ) as RecordCount
}
group by ClassType, Class
