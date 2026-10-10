// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_LocAcctAssignment
  as select from iloa
{
  key iloa.iloan as LocAcctAssignment,
      iloa.tplnr as FunctionalLocation,
      // TODO-VERIFY[L] XFL-004: ILOA field names (SWERK, BEBER, STORT, MSGRP, ABCKZ, EQFNR, BUKRS, GSBER, KOKRS, KOSTL, ANLNR, ANLUN, DAUFN)
      iloa.swerk as MaintenancePlant,
      iloa.beber as PlantSection,
      iloa.stort as AssetLocation,
      iloa.msgrp as AssetRoom,
      iloa.abckz as ABCIndicator,
      iloa.eqfnr as SortField,
      iloa.bukrs as CompanyCode,
      iloa.gsber as BusinessArea,
      iloa.kokrs as ControllingArea,
      iloa.kostl as CostCenter,
      iloa.anlnr as MasterFixedAsset,
      iloa.anlun as FixedAsset,
      iloa.daufn as StandingOrder
}
