// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_FuncLocHeader
  as select from iflot
{
  key iflot.tplnr as FunctionalLocation,
      iflot.fltyp as FunctionalLocationCategory,
      // TODO-VERIFY[M] XFL-001: structure indicator field is IFLOT-TPLKZ
      iflot.tplkz as FuncLocationStructure,
      iflot.tplma as SuperiorFunctionalLocation,
      iflot.eqart as TechnicalObjectType,
      iflot.begru as AuthorizationGroup,
      iflot.iwerk as MaintenancePlanningPlant,
      iflot.ingrp as MaintenancePlannerGroup,
      // TODO-VERIFY[M] XFL-002: IFLOT-IEQUI (installation allowed) and IFLOT-EINZL (single installation)
      iflot.iequi as EquipInstallationIsAllowed,
      iflot.einzl as EquipIsSingleInstallation,
      // TODO-VERIFY[M] XFL-003: IFLOT carries the general data fields SUBMT, HERST, BAUJJ, INVNR, INBDT like EQUI
      iflot.submt as ConstructionType,
      iflot.herst as AssetManufacturerName,
      iflot.baujj as ConstructionYear,
      iflot.invnr as InventoryNumber,
      iflot.inbdt as OperationStartDate,
      iflot.iloan as LocAcctAssignment,
      iflot.objnr as ObjectNumber,
      iflot.erdat as CreationDate,
      iflot.ernam as CreatedByUser,
      iflot.aedat as LastChangeDate
}
