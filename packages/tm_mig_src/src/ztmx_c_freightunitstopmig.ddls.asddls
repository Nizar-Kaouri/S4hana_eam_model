// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Native TOR stops filtered through the parent category FU. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.
// Purpose: Read FreightUnitStopMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitStopMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightUnitStopMig
  as select from ZTMX_I_FreightUnitStop as src
{
  key src.StopUUID as StopUUID,
      src.DocumentUUID as DocumentUUID,
      src.StopID as StopID,
      src.StopCategory as StopCategory,
      src.SequencePosition as SequencePosition
}
