// ModuPorter EAM migration | Release 1.0.0
// Purpose: Scheduled and completed calls per maintenance plan (MHIS).
// Example: Read the calls of plan 100.
@AbapCatalog.sqlViewName: 'ZEMX_MHIS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance plan call history'
@ObjectModel.representativeKey: 'MaintPlanCallNumber'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintPlanCallHistory
  as select from mhis
{
      @EndUserText.label: 'Maintenance Plan'
  key mhis.warpl as MaintenancePlan,
      // Compatibility note: MHIS field names (ABNUM, NPLDA, HORDA, LRMDT) and their meaning (planned date, call date, completion date)
      @EndUserText.label: 'Maint Plan Call Number'
  key mhis.abnum as MaintPlanCallNumber,
      @EndUserText.label: 'Planned Date'
      mhis.nplda as PlannedDate,
      @EndUserText.label: 'Call Date'
      mhis.horda as CallDate,
      @EndUserText.label: 'Completion Date'
      mhis.lrmdt as CompletionDate
}
