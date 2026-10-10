// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per work center of type 'A' (resource / work center) with plant, category, responsible person and validity; source for the work center migration object.
// Example: Extract all maintenance work centers of plant 1000: filter Plant = '1000' and WorkCenterCategoryCode = '0005'.
// Capacities (KAKO/CRCA) and formulas are not extracted in the pilot (see XWC-G01 in the mapping).
@AbapCatalog.sqlViewName: 'ZEMX_WC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Work center (migration extract)'
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_WorkCenter
  as select from crhd
{
  key crhd.objid      as WorkCenterInternalID,
      crhd.objty      as WorkCenterTypeCode,
      crhd.arbpl      as WorkCenter,
      crhd.werks      as Plant,
      // TODO-VERIFY[M] XWC-001: CRHD-VERWE is the work center category (e.g. 0005 plant maintenance)
      crhd.verwe      as WorkCenterCategoryCode,
      crhd.veran      as WorkCenterResponsible,
      // TODO-VERIFY[M] XWC-002: CRHD-PLANV is the task list usage of the work center
      crhd.planv      as TaskListUsage,
      crhd.begda      as ValidityStartDate,
      crhd.endda      as ValidityEndDate,
      crhd.lvorm      as IsMarkedForDeletion,
      // TODO-VERIFY[M] XWC-003: the change date of the work center basic data is CRHD-AEDAT_GRND
      crhd.aedat_grnd as LastChangeDate
}
where crhd.objty = 'A'
