// ModuPorter EAM migration | Release 1.0.0
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
define view ZEMX_B_MeasurementDocument
  as select from imrg
{
      @EndUserText.label: 'Measurement Document'
  key imrg.mdocm as MeasurementDocument,
      @EndUserText.label: 'Measuring Point'
      imrg.point as MeasuringPoint,
      @EndUserText.label: 'Msmt Rdng Date'
      imrg.idate as MsmtRdngDate,
      @EndUserText.label: 'Msmt Rdng Time'
      imrg.itime as MsmtRdngTime,
      @EndUserText.label: 'Msmt Rdng By User'
      imrg.readr as MsmtRdngByUser,
      @EndUserText.label: 'Measurement Reading'
      imrg.readg as MeasurementReading,
      @EndUserText.label: 'Measurement Counter Reading'
      imrg.cntrr as MeasurementCounterReading,
      // Compatibility note: IMRG field names CNTRR, CDIFF, RECDV, RECDU, VLCOD, CANCL, READR
      @EndUserText.label: 'Measurement Counter Difference'
      imrg.cdiff as MeasurementCounterDifference,
      @EndUserText.label: 'Msmt Reading In Entry Unit'
      imrg.recdv as MsmtReadingInEntryUnit,
      @EndUserText.label: 'Msmt Entry Unit'
      imrg.recdu as MsmtEntryUnit,
      @EndUserText.label: 'Msmt Valuation Code'
      imrg.vlcod as MsmtValuationCode,
      @EndUserText.label: 'Measurement Document Text'
      imrg.mdtxt as MeasurementDocumentText,
      @EndUserText.label: 'Msmt Document Is Cancelled'
      imrg.cancl as MsmtDocumentIsCancelled,
      @EndUserText.label: 'Creation Date'
      imrg.erdat as CreationDate,
      @EndUserText.label: 'Created By User'
      imrg.ernam as CreatedByUser
}
