// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Result cube: number of inspected and rejected characteristics and defects per characteristic, with
//   material, plant, supplier and lot origin from the lot.
// Example: Which characteristics fail most often for a supplier's materials.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Inspection Result - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #XL,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZQMV_I_InspectionCharc
  as select from ZQMV_B_InspectionCharc
{
      @ObjectModel.foreignKey.association: '_InspectionLot'
  key InspectionLot,
  key InspPlanOperationInternalID,
  key InspectionCharacteristic,
      InspectionCharacteristicText,
      InspectionSpecification,
      InspectionCharacteristicStatus,
      InspectionValuationResult,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Characteristics'
      cast( 1 as abap.int4 ) as NumberOfCharacteristics,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Rejected Characteristics'
      cast( case when InspectionValuationResult = 'R' then 1 else 0 end as abap.int4 ) as NumberOfRejectedCharcs,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Defects'
      InspectionResultNrOfDefects,

      /* Inspection lot characteristics */
      _InspectionLot.Material,
      _InspectionLot.Plant,
      _InspectionLot.Supplier,
      _InspectionLot.InspectionLotOrigin,
      _InspectionLot.InspLotCreatedOnLocalDate,

      /* Associations */
      _InspectionLot
}
