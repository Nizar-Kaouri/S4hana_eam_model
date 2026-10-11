// ModuPorter EAM migration | Release 1.0.0
// Purpose: Measuring point with the technical object it belongs to (decoded from the object number) and the characteristic name instead of the internal number.
// Example: Read the counters of equipment: filter MeasuringPointObjectType = 'IE' and MeasuringPointIsCounter = 'X'.
@AbapCatalog.sqlViewName: 'ZEMX_MP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Measuring point'
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MeasuringPoint
  as select from ZEMX_I_MeasuringPointHeader as mp
{
      @EndUserText.label: 'Measuring Point'
  key mp.MeasuringPoint              as MeasuringPoint,
      @EndUserText.label: 'Measuring Point Description'
      mp.MeasuringPointDescription   as MeasuringPointDescription,
      @EndUserText.label: 'Measuring Point Category'
      mp.MeasuringPointCategory      as MeasuringPointCategory,
      @EndUserText.label: 'Measuring Point Position Number'
      mp.MeasuringPointPositionNumber as MeasuringPointPositionNumber,
      @EndUserText.label: 'Measuring Point Object Type'
      mp.MeasuringPointObjectType    as MeasuringPointObjectType,
      @EndUserText.label: 'Technical Object Key'
      mp.TechnicalObjectKey          as TechnicalObjectKey,
      @EndUserText.label: 'Characteristic'
      mp._Characteristic.Characteristic as Characteristic,
      @EndUserText.label: 'Measuring Point Is Counter'
      mp.MeasuringPointIsCounter     as MeasuringPointIsCounter,
      @EndUserText.label: 'Measuring Point Decimal Places'
      mp.MeasuringPointDecimalPlaces as MeasuringPointDecimalPlaces,
      @EndUserText.label: 'Measurement Range Unit'
      mp.MeasurementRangeUnit        as MeasurementRangeUnit,
      @EndUserText.label: 'Lower Range Limit'
      mp.LowerRangeLimit             as LowerRangeLimit,
      @EndUserText.label: 'Upper Range Limit'
      mp.UpperRangeLimit             as UpperRangeLimit,
      @EndUserText.label: 'Target Value'
      mp.TargetValue                 as TargetValue,
      @EndUserText.label: 'Code Group'
      mp.CodeGroup                   as CodeGroup,
      @EndUserText.label: 'Measuring Point Is Inactive'
      mp.MeasuringPointIsInactive    as MeasuringPointIsInactive,
      @EndUserText.label: 'Authorization Group'
      mp.AuthorizationGroup          as AuthorizationGroup,
      @EndUserText.label: 'Measuring Point Object Number'
      mp.MeasuringPointObjectNumber  as MeasuringPointObjectNumber,
      @EndUserText.label: 'Charc Internal ID'
      mp.CharcInternalID             as CharcInternalID,
      @EndUserText.label: 'Is Marked For Deletion'
      mp.IsMarkedForDeletion         as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      mp.CreationDate                as CreationDate,
      @EndUserText.label: 'Created By User'
      mp.CreatedByUser               as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      mp.LastChangeDate              as LastChangeDate
}
