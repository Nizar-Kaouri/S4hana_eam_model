// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per measurement document (reading or counter reading) with reading date / time, values in SI and entry unit, valuation code and cancellation flag.
// Example: Extract the readings of the last two years: filter MsmtRdngDate >= '20240101' and MsmtDocumentIsCancelled = ''.
// TODO-VERIFY[M] XMD-003: measurement documents are not changed after creation (only cancelled), so CreationDate is a usable delta element
@AbapCatalog.sqlViewName: 'ZEMX_MD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'CreationDate'
@EndUserText.label: 'Measurement document (migration extract)'
@ObjectModel.representativeKey: 'MeasurementDocument'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MeasurementDocument
  as select from imrg
{
  key imrg.mdocm as MeasurementDocument,
      imrg.point as MeasuringPoint,
      imrg.idate as MsmtRdngDate,
      imrg.itime as MsmtRdngTime,
      imrg.readr as MsmtRdngByUser,
      imrg.readg as MeasurementReading,
      imrg.cntrr as MeasurementCounterReading,
      // TODO-VERIFY[M] XMD-001: IMRG field names CNTRR, CDIFF, RECDV, RECDU, VLCOD, CANCL, READR
      imrg.cdiff as MeasurementCounterDifference,
      imrg.recdv as MsmtReadingInEntryUnit,
      imrg.recdu as MsmtEntryUnit,
      imrg.vlcod as MsmtValuationCode,
      imrg.mdtxt as MeasurementDocumentText,
      imrg.cancl as MsmtDocumentIsCancelled,
      imrg.erdat as CreationDate,
      imrg.ernam as CreatedByUser
}
