// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Index of the SAPscript long texts of EAM objects (STXH): which texts exist, in which language, when changed.
// Example: Count the equipment long texts: filter TextObject = 'EQUI'.
// The text lines are stored compressed in STXL and cannot be read with CDS; the load program reads them with READ_TEXT (see XLT-G01).
@AbapCatalog.sqlViewName: 'ZEMX_STXH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Long text header'
@ObjectModel.representativeKey: 'Language'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_LongTextHeader
  as select from stxh
{
      // TODO-VERIFY[H] XLT-001: text objects EQUI, IFLOT, QMEL, AUFK, ROUTING, MPLA, MPOS and the text name format per object
      @EndUserText.label: 'Text Object'
  key stxh.tdobject as TextObject,
      @EndUserText.label: 'Text Name'
  key stxh.tdname   as TextName,
      @EndUserText.label: 'Text ID'
  key stxh.tdid     as TextID,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key stxh.tdspras  as Language,
      @EndUserText.label: 'Creation Date'
      stxh.tdfdate  as CreationDate,
      @EndUserText.label: 'Created By User'
      stxh.tdfuser  as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      stxh.tdldate  as LastChangeDate,
      @EndUserText.label: 'Last Changed By User'
      stxh.tdluser  as LastChangedByUser
}
where stxh.tdobject = 'EQUI' or stxh.tdobject = 'IFLOT' or stxh.tdobject = 'QMEL' or stxh.tdobject = 'AUFK' or stxh.tdobject = 'ROUTING' or stxh.tdobject = 'MPLA' or stxh.tdobject = 'MPOS'
