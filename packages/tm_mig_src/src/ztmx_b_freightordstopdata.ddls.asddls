// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR stops filtered through the parent category TO. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.
// Purpose: Read FreightOrdStopData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-016: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrdStopData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_B_FreightOrdStopData
  as select from /scmtms/d_torstp as src
{
  key src.db_key as StopUUID,
      src.parent_key as DocumentUUID,
      src.stop_id as StopID,
      src.stop_cat as StopCategory,
      src.stop_seq_pos as SequencePosition
}
