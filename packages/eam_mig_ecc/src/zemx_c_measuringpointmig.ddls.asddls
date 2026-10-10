// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Measuring points to migrate with technical object key, characteristic and codes translated; range values stay in the SI unit (converted by the load program).
// Example: The load program creates the measuring point at the translated technical object.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MEASURING_POINT' and map01.SourceValue = src.MeasuringPoint
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'MEASURING_POINT_CATEGORY' and map02.SourceValue = src.MeasuringPointCategory
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'EQUIPMENT' and map03.SourceValue = src.TechnicalObjectKey and src.MeasuringPointObjectType = 'IE'
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'FUNCTIONAL_LOCATION' and map04.SourceValue = src.TechnicalObjectKey and src.MeasuringPointObjectType = 'IF'
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'UNIT_OF_MEASURE' and map05.SourceValue = src.MeasurementRangeUnit
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'CODE_GROUP' and map06.SourceValue = src.CodeGroup
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'AUTHORIZATION_GROUP' and map07.SourceValue = src.AuthorizationGroup
{
  key src.MeasuringPoint             as LegacyMeasuringPoint,
      coalesce( map01.TargetValue, src.MeasuringPoint ) as MeasuringPoint,
      src.MeasuringPointDescription  as MeasuringPointDescription,
      coalesce( map02.TargetValue, src.MeasuringPointCategory ) as MeasuringPointCategory,
      src.MeasuringPointPositionNumber as MeasuringPointPositionNumber,
      src.MeasuringPointObjectType   as MeasuringPointObjectType,
      coalesce( map03.TargetValue, coalesce( map04.TargetValue, src.TechnicalObjectKey ) ) as TechnicalObjectKey,
      src.Characteristic             as Characteristic,
      src.MeasuringPointIsCounter    as MeasuringPointIsCounter,
      src.MeasuringPointDecimalPlaces as MeasuringPointDecimalPlaces,
      coalesce( map05.TargetValue, src.MeasurementRangeUnit ) as MeasurementRangeUnit,
      src.LowerRangeLimit            as LowerRangeLimit,
      src.UpperRangeLimit            as UpperRangeLimit,
      src.TargetValue                as TargetValue,
      coalesce( map06.TargetValue, src.CodeGroup ) as CodeGroup,
      src.MeasuringPointIsInactive   as MeasuringPointIsInactive,
      coalesce( map07.TargetValue, src.AuthorizationGroup ) as AuthorizationGroup,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
