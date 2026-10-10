// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Scheduled and completed calls per maintenance plan: needed to set the start / last completion date so that the schedule continues seamlessly after go-live.
// Example: Find the last completed call of plan 100: filter MaintenancePlan = '000000000100', highest CallNumber with a CompletionDate.
@AbapCatalog.sqlViewName: 'ZEMX_PLH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan call history (migration extract)'
@ObjectModel.representativeKey: 'MaintPlanCallNumber'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintPlanCallHistory
  as select from mhis
{
  key mhis.warpl as MaintenancePlan,
      // TODO-VERIFY[H] XPL-006: MHIS field names (ABNUM, NPLDA, HORDA, LRMDT) and their meaning (planned date, call date, completion date)
  key mhis.abnum as MaintPlanCallNumber,
      mhis.nplda as PlannedDate,
      mhis.horda as CallDate,
      mhis.lrmdt as CompletionDate
}
