// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per profit center valid today: segment and person responsible; dimension for cost and margin
//   cubes.
// Example: Costs per profit center and segment.
// TODO-VERIFY[M] CO-020: I_ProfitCenter keys ControllingArea, ProfitCenter, ValidityEndDate; elements Segment, ProfitCtrResponsiblePersonName
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Profit Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'ProfitCenter'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZCOV_B_ProfitCenter
  as select from I_ProfitCenter
  association [0..*] to ZCOV_B_ProfitCenterText as _Text on $projection.ControllingArea = _Text.ControllingArea
    and $projection.ProfitCenter = _Text.ProfitCenter
{
  key ControllingArea,
      @ObjectModel.text.association: '_Text'
  key ProfitCenter,
      Segment,
      ProfitCtrResponsiblePersonName,
      ValidityStartDate,
      ValidityEndDate,

      /* Associations */
      _Text
}
where
  ValidityStartDate <= $session.system_date and ValidityEndDate >= $session.system_date
