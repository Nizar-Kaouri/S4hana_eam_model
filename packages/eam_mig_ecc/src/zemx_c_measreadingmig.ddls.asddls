// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Last valid reading per measuring point with the measuring point translated (key map from the measuring point load); values in the SI unit.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MEASURING_POINT' and map01.SourceValue = src.MeasuringPoint
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'UNIT_OF_MEASURE' and map02.SourceValue = src.MsmtEntryUnit
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'CODE' and map03.SourceValue = src.MsmtValuationCode
{
  key src.MeasuringPoint             as LegacyMeasuringPoint,
      coalesce( map01.TargetValue, src.MeasuringPoint ) as MeasuringPoint,
      src.MsmtRdngDate               as MsmtRdngDate,
      src.MsmtRdngTime               as MsmtRdngTime,
      src.MsmtRdngByUser             as MsmtRdngByUser,
      src.MeasurementReading         as MeasurementReading,
      src.MeasurementCounterReading  as MeasurementCounterReading,
      src.MsmtReadingInEntryUnit     as MsmtReadingInEntryUnit,
      coalesce( map02.TargetValue, src.MsmtEntryUnit ) as MsmtEntryUnit,
      coalesce( map03.TargetValue, src.MsmtValuationCode ) as MsmtValuationCode,
      src.MeasurementDocumentText    as MeasurementDocumentText
}
