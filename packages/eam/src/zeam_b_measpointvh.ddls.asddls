// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for measuring points (number, description, reference object).
// Example: Value help for MeasuringPoint in a reading-entry or analysis app.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Measuring Point - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'MeasuringPoint'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_B_MeasPointVH
  as select from ZEAM_B_MeasPoint
{
      @ObjectModel.text.element: [ 'MeasuringPointDescription' ]
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key MeasuringPoint,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      MeasuringPointDescription,
      MeasuringPointCategory,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      Equipment,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      FunctionalLocation,
      MeasurementRangeUnit,
      MeasuringPointIsCounter,
      AuthorizationGroup
}
