// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per cost center valid today: company code, category, profit center, business area, functional
//   area and person responsible; dimension for cost cubes.
// Example: Costs per cost center category; cost centers per profit center.
// TODO-VERIFY[M] CO-001: I_CostCenter keys ControllingArea, CostCenter, ValidityEndDate and the 'valid today' filter
// TODO-VERIFY[M] CO-002: elements CostCenterCategory, ProfitCenter, BusinessArea, FunctionalArea, CostCtrResponsiblePersonName
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Cost Center'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'CostCenter'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZCOV_I_CostCenter
  as select from I_CostCenter
  association [0..*] to ZCOV_I_CostCenterText as _Text on $projection.ControllingArea = _Text.ControllingArea
    and $projection.CostCenter = _Text.CostCenter
  association [0..1] to I_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
{
  key ControllingArea,
      @ObjectModel.text.association: '_Text'
  key CostCenter,
      @ObjectModel.foreignKey.association: '_CompanyCode'
      CompanyCode,
      CostCenterCategory,
      ProfitCenter,
      BusinessArea,
      FunctionalArea,
      CostCtrResponsiblePersonName,
      ValidityStartDate,
      ValidityEndDate,

      /* Associations */
      _Text,
      _CompanyCode
}
where
  ValidityStartDate <= $session.system_date and ValidityEndDate >= $session.system_date
