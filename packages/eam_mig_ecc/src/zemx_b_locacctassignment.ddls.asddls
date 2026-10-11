// ModuPorter EAM migration | Release 1.0.0
// Purpose: Location and account assignment data (ILOA) shared by functional locations, equipment, notifications, orders and maintenance items.
// Example: Read the plant section and cost center of location record 0000123456.
@AbapCatalog.sqlViewName: 'ZEMX_ILOA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Location and account assignment'
@ObjectModel.representativeKey: 'LocAcctAssignment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_B_LocAcctAssignment
  as select from iloa
{
      @EndUserText.label: 'Loc Acct Assignment'
  key iloa.iloan as LocAcctAssignment,
      @EndUserText.label: 'Functional Location'
      iloa.tplnr as FunctionalLocation,
      // Compatibility note: ILOA field names (SWERK, BEBER, STORT, MSGRP, ABCKZ, EQFNR, BUKRS, GSBER, KOKRS, KOSTL, ANLNR, ANLUN, DAUFN)
      @EndUserText.label: 'Maintenance Plant'
      iloa.swerk as MaintenancePlant,
      @EndUserText.label: 'Plant Section'
      iloa.beber as PlantSection,
      @EndUserText.label: 'Asset Location'
      iloa.stort as AssetLocation,
      @EndUserText.label: 'Asset Room'
      iloa.msgrp as AssetRoom,
      @EndUserText.label: 'ABCIndicator'
      iloa.abckz as ABCIndicator,
      @EndUserText.label: 'Sort Field'
      iloa.eqfnr as SortField,
      @EndUserText.label: 'Company Code'
      iloa.bukrs as CompanyCode,
      @EndUserText.label: 'Business Area'
      iloa.gsber as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      iloa.kokrs as ControllingArea,
      @EndUserText.label: 'Cost Center'
      iloa.kostl as CostCenter,
      @EndUserText.label: 'Master Fixed Asset'
      iloa.anlnr as MasterFixedAsset,
      @EndUserText.label: 'Fixed Asset'
      iloa.anlun as FixedAsset,
      @EndUserText.label: 'Standing Order'
      iloa.daufn as StandingOrder
}
