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
  key src.MeasuringPoint             as MeasuringPoint,
      src.MeasuringPointDescription  as MeasuringPointDescription,
      src.MeasuringPointCategory     as MeasuringPointCategory,
      src.MeasuringPointPositionNumber as MeasuringPointPositionNumber,
      src.MeasuringPointObjectType   as MeasuringPointObjectType,
      src.TechnicalObjectKey         as TechnicalObjectKey,
      src.Characteristic             as Characteristic,
      src.MeasuringPointIsCounter    as MeasuringPointIsCounter,
      src.MeasuringPointDecimalPlaces as MeasuringPointDecimalPlaces,
      src.MeasurementRangeUnit       as MeasurementRangeUnit,
      src.LowerRangeLimit            as LowerRangeLimit,
      src.UpperRangeLimit            as UpperRangeLimit,
      src.TargetValue                as TargetValue,
      src.CodeGroup                  as CodeGroup,
      src.MeasuringPointIsInactive   as MeasuringPointIsInactive,
      src.AuthorizationGroup         as AuthorizationGroup,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
