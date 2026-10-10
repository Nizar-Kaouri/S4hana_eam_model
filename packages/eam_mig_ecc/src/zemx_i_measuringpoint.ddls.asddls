// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per measuring point / counter with the technical object it belongs to (decoded from the object number), characteristic name, ranges and counter indicator.
// Example: Extract the counters of equipment: filter MeasuringPointObjectType = 'IE' and MeasuringPointIsCounter = 'X'.
@AbapCatalog.sqlViewName: 'ZEMX_MP'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Measuring point (migration extract)'
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MeasuringPoint
  as select from imptt
    left outer join cabn on cabn.atinn = imptt.atinn and cabn.adzhl = '0000'
{
  key imptt.point                    as MeasuringPoint,
      imptt.pttxt                    as MeasuringPointDescription,
      imptt.mptyp                    as MeasuringPointCategory,
      imptt.psort                    as MeasuringPointPositionNumber,
      // TODO-VERIFY[H] XMP-001: IMPTT-MPOBJ is the object number 'IE' + EQUNR (equipment) or 'IF' + TPLNR (functional location)
      substring( imptt.mpobj, 1, 2 ) as MeasuringPointObjectType,
      substring( imptt.mpobj, 3, 30 ) as TechnicalObjectKey,
      // TODO-VERIFY[M] XMP-002: CABN rows of characteristics without engineering change management have ADZHL = '0000'
      cabn.atnam                     as Characteristic,
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
