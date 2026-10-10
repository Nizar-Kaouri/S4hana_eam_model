// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Measuring points to migrate with technical object key and characteristic name; range values stay in the SI unit (converted by the load program).
// Example: The load program creates the measuring point at its technical object.
@AbapCatalog.sqlViewName: 'ZEMX_CMP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Measuring point (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MeasuringPointMig
  as select from ZEMX_I_MeasuringPoint as src
{
      @EndUserText.label: 'Measuring Point'
  key src.MeasuringPoint             as MeasuringPoint,
      @EndUserText.label: 'Measuring Point Description'
      src.MeasuringPointDescription  as MeasuringPointDescription,
      @EndUserText.label: 'Measuring Point Category'
      src.MeasuringPointCategory     as MeasuringPointCategory,
      @EndUserText.label: 'Measuring Point Position Number'
      src.MeasuringPointPositionNumber as MeasuringPointPositionNumber,
      @EndUserText.label: 'Measuring Point Object Type'
      src.MeasuringPointObjectType   as MeasuringPointObjectType,
      @EndUserText.label: 'Technical Object Key'
      src.TechnicalObjectKey         as TechnicalObjectKey,
      @EndUserText.label: 'Characteristic'
      src.Characteristic             as Characteristic,
      @EndUserText.label: 'Measuring Point Is Counter'
      src.MeasuringPointIsCounter    as MeasuringPointIsCounter,
      @EndUserText.label: 'Measuring Point Decimal Places'
      src.MeasuringPointDecimalPlaces as MeasuringPointDecimalPlaces,
      @EndUserText.label: 'Measurement Range Unit'
      src.MeasurementRangeUnit       as MeasurementRangeUnit,
      @EndUserText.label: 'Lower Range Limit'
      src.LowerRangeLimit            as LowerRangeLimit,
      @EndUserText.label: 'Upper Range Limit'
      src.UpperRangeLimit            as UpperRangeLimit,
      @EndUserText.label: 'Target Value'
      src.TargetValue                as TargetValue,
      @EndUserText.label: 'Code Group'
      src.CodeGroup                  as CodeGroup,
      @EndUserText.label: 'Measuring Point Is Inactive'
      src.MeasuringPointIsInactive   as MeasuringPointIsInactive,
      @EndUserText.label: 'Authorization Group'
      src.AuthorizationGroup         as AuthorizationGroup,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
