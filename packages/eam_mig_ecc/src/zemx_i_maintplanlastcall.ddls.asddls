// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Last call number and last completion date per maintenance plan: the restart point of the schedule on S/4HANA.
// Example: Read the last completion date of plan 100.
@AbapCatalog.sqlViewName: 'ZEMX_PLL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance plan last call'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintPlanLastCall
  as select from ZEMX_I_MaintPlanCallHistory as cal
{
      @EndUserText.label: 'Maintenance Plan'
  key cal.MaintenancePlan            as MaintenancePlan,
      @EndUserText.label: 'Last Call Number'
      max( cal.MaintPlanCallNumber ) as LastCallNumber,
      @EndUserText.label: 'Last Completion Date'
      max( cal.CompletionDate )      as LastCompletionDate
}
group by cal.MaintenancePlan
