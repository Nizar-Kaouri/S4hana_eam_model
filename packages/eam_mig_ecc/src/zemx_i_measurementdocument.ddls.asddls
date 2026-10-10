// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Measurement documents (IMRG): readings and counter readings with date, time, values, valuation code and cancellation flag.
// Example: Read the readings of measuring point 1234 in 2025.
@AbapCatalog.sqlViewName: 'ZEMX_IMRG'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Measurement document'
@ObjectModel.representativeKey: 'MeasurementDocument'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
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
