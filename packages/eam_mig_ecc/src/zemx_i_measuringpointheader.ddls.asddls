// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Measuring points and counters (IMPTT) with object number, characteristic, ranges and indicators.
// Example: Read the counters: filter MeasuringPointIsCounter = 'X'.
@AbapCatalog.sqlViewName: 'ZEMX_IMPTT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Measuring point header'
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MeasuringPointHeader
  as select from imptt
{
  key imptt.point                    as MeasuringPoint,
      imptt.pttxt                    as MeasuringPointDescription,
      imptt.mptyp                    as MeasuringPointCategory,
      imptt.psort                    as MeasuringPointPositionNumber,
      // TODO-VERIFY[H] XMP-001: IMPTT-MPOBJ is the object number 'IE' + EQUNR (equipment) or 'IF' + TPLNR (functional location)
      imptt.mpobj                    as MeasuringPointObjectNumber,
      substring( imptt.mpobj, 1, 2 ) as MeasuringPointObjectType,
      substring( imptt.mpobj, 3, 30 ) as TechnicalObjectKey,
      imptt.atinn                    as CharcInternalID,
      imptt.indct                    as MeasuringPointIsCounter,
      imptt.decim                    as MeasuringPointDecimalPlaces,
      // TODO-VERIFY[M] XMP-003: IMPTT field names MRNGU, MRMIN, MRMAX, DESIR, CODGR, INACT, LVORM, BEGRU
      imptt.mrngu                    as MeasurementRangeUnit,
      // TODO-VERIFY[H] XMP-004: limits and target values are stored as floating point numbers in the SI unit of the characteristic
      imptt.mrmin                    as LowerRangeLimit,
      imptt.mrmax                    as UpperRangeLimit,
      imptt.desir                    as TargetValue,
      imptt.codgr                    as CodeGroup,
      imptt.inact                    as MeasuringPointIsInactive,
      imptt.begru                    as AuthorizationGroup,
      imptt.lvorm                    as IsMarkedForDeletion,
      imptt.erdat                    as CreationDate,
      imptt.ernam                    as CreatedByUser,
      imptt.aedat                    as LastChangeDate
}
