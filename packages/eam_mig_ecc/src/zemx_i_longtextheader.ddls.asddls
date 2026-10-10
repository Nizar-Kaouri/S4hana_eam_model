// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Index of the SAPscript long texts of EAM objects (equipment, functional location, notification, order, task list, maintenance plan / item): which texts exist, in which language, when changed.
// Example: Count the equipment long texts to migrate: filter TextObject = 'EQUI'.
// The text lines are stored compressed in STXL and cannot be read with CDS; use READ_TEXT (see XLT-G01).
@AbapCatalog.sqlViewName: 'ZEMX_LT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Long text header (migration extract)'
@ObjectModel.representativeKey: 'Language'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_LongTextHeader
  as select from stxh
{
      // TODO-VERIFY[H] XLT-001: text objects EQUI, IFLOT, QMEL, AUFK, ROUTING, MPLA, MPOS and the text name format per object
  key stxh.tdobject as TextObject,
  key stxh.tdname   as TextName,
  key stxh.tdid     as TextID,
      @Semantics.language: true
  key stxh.tdspras  as Language,
      stxh.tdfdate  as CreationDate,
      stxh.tdfuser  as CreatedByUser,
      stxh.tdldate  as LastChangeDate,
      stxh.tdluser  as LastChangedByUser
}
where stxh.tdobject = 'EQUI' or stxh.tdobject = 'IFLOT' or stxh.tdobject = 'QMEL' or stxh.tdobject = 'AUFK' or stxh.tdobject = 'ROUTING' or stxh.tdobject = 'MPLA' or stxh.tdobject = 'MPOS'
