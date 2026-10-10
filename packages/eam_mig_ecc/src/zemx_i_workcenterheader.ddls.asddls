// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work centers of object type 'A' (CRHD) with plant, category, responsible person, validity and deletion flag.
// Example: Read the work centers of plant 1000: filter Plant = '1000'.
@AbapCatalog.sqlViewName: 'ZEMX_CRHD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Work center header'
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_WorkCenterHeader
  as select from crhd
{
  key crhd.objid      as WorkCenterInternalID,
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
