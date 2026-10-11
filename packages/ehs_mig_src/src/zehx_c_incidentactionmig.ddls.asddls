// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.
// Purpose: Read IncidentActionMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V012C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentActionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_IncidentActionMig
  as select from ZEHX_I_IncidentAction as src
{
  key src.ActionUUID as ActionUUID,
      src.ActionID as ActionID,
      src.ActionCategory as ActionCategory,
      src.ActionStatus as ActionStatus,
      src.ActionType as ActionType,
      src.Priority as Priority,
      src.ProtectionGoal as ProtectionGoal,
      src.Effectiveness as Effectiveness,
      src.DueTimestamp as DueTimestamp,
      src.DueTimeZone as DueTimeZone,
      src.ResponsiblePerson as ResponsiblePerson,
      src.Implementer as Implementer,
      src.Approver as Approver,
      src.ImplementedAt as ImplementedAt,
      src.ImplementationTimeZone as ImplementationTimeZone,
      src.ApprovedAt as ApprovedAt,
      src.ApprovalTimeZone as ApprovalTimeZone
}
