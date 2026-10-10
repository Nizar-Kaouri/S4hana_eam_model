// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Last valid reading per measuring point; values in the SI unit.
// Example: The load program posts one measurement document per row as the initial reading on S/4HANA.
@AbapCatalog.sqlViewName: 'ZEMX_CMR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Last measurement reading (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MeasReadingMig
  as select from ZEMX_I_MeasPointLastReading as src
{
  key src.MeasuringPoint            as MeasuringPoint,
      src.MsmtRdngDate              as MsmtRdngDate,
      src.MsmtRdngTime              as MsmtRdngTime,
      src.MsmtRdngByUser            as MsmtRdngByUser,
      src.MeasurementReading        as MeasurementReading,
      src.MeasurementCounterReading as MeasurementCounterReading,
      src.MsmtReadingInEntryUnit    as MsmtReadingInEntryUnit,
      src.MsmtEntryUnit             as MsmtEntryUnit,
      src.MsmtValuationCode         as MsmtValuationCode,
      src.MeasurementDocumentText   as MeasurementDocumentText
}
