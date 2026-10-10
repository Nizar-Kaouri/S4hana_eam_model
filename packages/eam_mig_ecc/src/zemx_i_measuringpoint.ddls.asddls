// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
    left outer join ZEMX_I_Characteristic as chr on chr.CharcInternalID = mp.CharcInternalID
{
  key mp.MeasuringPoint              as MeasuringPoint,
      mp.MeasuringPointDescription   as MeasuringPointDescription,
      mp.MeasuringPointCategory      as MeasuringPointCategory,
      mp.MeasuringPointPositionNumber as MeasuringPointPositionNumber,
      mp.MeasuringPointObjectType    as MeasuringPointObjectType,
      mp.TechnicalObjectKey          as TechnicalObjectKey,
      chr.Characteristic             as Characteristic,
      mp.MeasuringPointIsCounter     as MeasuringPointIsCounter,
      mp.MeasuringPointDecimalPlaces as MeasuringPointDecimalPlaces,
      mp.MeasurementRangeUnit        as MeasurementRangeUnit,
      mp.LowerRangeLimit             as LowerRangeLimit,
      mp.UpperRangeLimit             as UpperRangeLimit,
      mp.TargetValue                 as TargetValue,
      mp.CodeGroup                   as CodeGroup,
      mp.MeasuringPointIsInactive    as MeasuringPointIsInactive,
      mp.AuthorizationGroup          as AuthorizationGroup,
      mp.MeasuringPointObjectNumber  as MeasuringPointObjectNumber,
      mp.CharcInternalID             as CharcInternalID,
      mp.IsMarkedForDeletion         as IsMarkedForDeletion,
      mp.CreationDate                as CreationDate,
      mp.CreatedByUser               as CreatedByUser,
      mp.LastChangeDate              as LastChangeDate
}
