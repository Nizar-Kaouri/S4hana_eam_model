// ModuPorter EAM migration | Release 1.0.0
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
define view ZEMX_B_MeasuringPointHeader
  as select from imptt
  association [0..1] to ZEMX_B_Characteristic as _Characteristic on $projection.CharcInternalID = _Characteristic.CharcInternalID
{
      @EndUserText.label: 'Measuring Point'
  key imptt.point                    as MeasuringPoint,
      @EndUserText.label: 'Measuring Point Description'
      imptt.pttxt                    as MeasuringPointDescription,
      @EndUserText.label: 'Measuring Point Category'
      imptt.mptyp                    as MeasuringPointCategory,
      @EndUserText.label: 'Measuring Point Position Number'
      imptt.psort                    as MeasuringPointPositionNumber,
      // Compatibility note: IMPTT-MPOBJ is the object number 'IE' + EQUNR (equipment) or 'IF' + TPLNR (functional location)
      @EndUserText.label: 'Measuring Point Object Number'
      imptt.mpobj                    as MeasuringPointObjectNumber,
      @EndUserText.label: 'Measuring Point Object Type'
      substring( imptt.mpobj, 1, 2 ) as MeasuringPointObjectType,
      @EndUserText.label: 'Technical Object Key'
      substring( imptt.mpobj, 3, 30 ) as TechnicalObjectKey,
      @EndUserText.label: 'Charc Internal ID'
      imptt.atinn                    as CharcInternalID,
      @EndUserText.label: 'Measuring Point Is Counter'
      imptt.indct                    as MeasuringPointIsCounter,
      @EndUserText.label: 'Measuring Point Decimal Places'
      imptt.decim                    as MeasuringPointDecimalPlaces,
      // Compatibility note: IMPTT field names MRNGU, MRMIN, MRMAX, DESIR, CODGR, INACT, LVORM, BEGRU
      @EndUserText.label: 'Measurement Range Unit'
      imptt.mrngu                    as MeasurementRangeUnit,
      // Compatibility note: limits and target values are stored as floating point numbers in the SI unit of the characteristic
      @EndUserText.label: 'Lower Range Limit'
      imptt.mrmin                    as LowerRangeLimit,
      @EndUserText.label: 'Upper Range Limit'
      imptt.mrmax                    as UpperRangeLimit,
      @EndUserText.label: 'Target Value'
      imptt.desir                    as TargetValue,
      @EndUserText.label: 'Code Group'
      imptt.codgr                    as CodeGroup,
      @EndUserText.label: 'Measuring Point Is Inactive'
      imptt.inact                    as MeasuringPointIsInactive,
      @EndUserText.label: 'Authorization Group'
      imptt.begru                    as AuthorizationGroup,
      @EndUserText.label: 'Is Marked For Deletion'
      imptt.lvorm                    as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      imptt.erdat                    as CreationDate,
      @EndUserText.label: 'Created By User'
      imptt.ernam                    as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      imptt.aedat                    as LastChangeDate,
      _Characteristic
}
