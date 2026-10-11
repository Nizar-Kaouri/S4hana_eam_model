// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.
// Purpose: Read IncidentActionData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'IncidentActionData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_IncidentActionData
  as select from ehhssd_iac_root as src
{
  key src.db_key as ActionUUID,
      src.id as ActionID,
      src.category as ActionCategory,
      src.status as ActionStatus,
      src.type as ActionType,
      src.priority as Priority,
      src.prot_goal as ProtectionGoal,
      src.effectiv as Effectiveness,
      src.due_timestamp as DueTimestamp,
      src.due_ti_zo as DueTimeZone,
      src.resp_id as ResponsiblePerson,
      src.implem_id as Implementer,
      src.appr_id as Approver,
      src.impl_timestamp as ImplementedAt,
      src.impl_ti_zo as ImplementationTimeZone,
      src.appr_timestamp as ApprovedAt,
      src.appr_ti_zo as ApprovalTimeZone
}
