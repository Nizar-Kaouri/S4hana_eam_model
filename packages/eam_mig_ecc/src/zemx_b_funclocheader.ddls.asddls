// ModuPorter EAM migration | Release 1.0.0
// Purpose: Functional location master records (IFLOT) with category, hierarchy, planning data and general data.
// Example: Read the superior location of FL 1000-PUMP-01.
@AbapCatalog.sqlViewName: 'ZEMX_IFLOT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional location header'
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_FuncLocHeader
  as select from iflot
  association [0..1] to ZEMX_B_LocAcctAssignment as _LocAcctAssignment on $projection.LocAcctAssignment = _LocAcctAssignment.LocAcctAssignment
  association [0..1] to ZEMX_B_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
      @EndUserText.label: 'Functional Location'
  key iflot.tplnr as FunctionalLocation,
      @EndUserText.label: 'Functional Location Category'
      iflot.fltyp as FunctionalLocationCategory,
      // Compatibility note: structure indicator field is IFLOT-TPLKZ
      @EndUserText.label: 'Func Location Structure'
      iflot.tplkz as FuncLocationStructure,
      @EndUserText.label: 'Superior Functional Location'
      iflot.tplma as SuperiorFunctionalLocation,
      @EndUserText.label: 'Technical Object Type'
      iflot.eqart as TechnicalObjectType,
      @EndUserText.label: 'Authorization Group'
      iflot.begru as AuthorizationGroup,
      @EndUserText.label: 'Maintenance Planning Plant'
      iflot.iwerk as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      iflot.ingrp as MaintenancePlannerGroup,
      // Compatibility note: IFLOT-IEQUI (installation allowed) and IFLOT-EINZL (single installation)
      @EndUserText.label: 'Equip Installation Is Allowed'
      iflot.iequi as EquipInstallationIsAllowed,
      @EndUserText.label: 'Equip Is Single Installation'
      iflot.einzl as EquipIsSingleInstallation,
      // Compatibility note: IFLOT carries the general data fields SUBMT, HERST, BAUJJ, INVNR, INBDT like EQUI
      @EndUserText.label: 'Construction Type'
      iflot.submt as ConstructionType,
      @EndUserText.label: 'Asset Manufacturer Name'
      iflot.herst as AssetManufacturerName,
      @EndUserText.label: 'Construction Year'
      iflot.baujj as ConstructionYear,
      @EndUserText.label: 'Inventory Number'
      iflot.invnr as InventoryNumber,
      @EndUserText.label: 'Operation Start Date'
      iflot.inbdt as OperationStartDate,
      @EndUserText.label: 'Loc Acct Assignment'
      iflot.iloan as LocAcctAssignment,
      @EndUserText.label: 'Object Number'
      iflot.objnr as ObjectNumber,
      @EndUserText.label: 'Creation Date'
      iflot.erdat as CreationDate,
      @EndUserText.label: 'Created By User'
      iflot.ernam as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      iflot.aedat as LastChangeDate,
      _LocAcctAssignment,
      _DeletionFlag
}
