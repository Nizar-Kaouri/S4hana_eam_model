// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per functional location with hierarchy (superior location), category, planning data and location / account assignment from ILOA; source for the functional location migration object.
// Example: Extract the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000' and load parents before children (SuperiorFunctionalLocation).
// Alternative labeling (IFLOS) is not extracted: FunctionalLocation is the internal key TPLNR (see XFL-G01).
// TODO-VERIFY[H] XGEN-001: system status codes I0076 (DLFL), I0072 (NOCO), I0045 (TECO), I0046 (CLSD) and table JEST (OBJNR, STAT, INACT)
// TODO-VERIFY[H] XGEN-002: literal comparisons in the ON condition of a left outer join and simple CASE are supported on 7.40 SP08
// TODO-VERIFY[M] XGEN-003: the change date (AEDAT) of the header table is also set when ILOA / status change; otherwise the delta misses those changes (plan a full reload at cutover)
@AbapCatalog.sqlViewName: 'ZEMX_FL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Functional location (migration extract)'
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_FuncLoc
  as select from iflot
    left outer join iloa on iloa.iloan = iflot.iloan
    left outer join jest as dlfl on dlfl.objnr = iflot.objnr and dlfl.stat = 'I0076' and dlfl.inact = ''
{
  key iflot.tplnr                    as FunctionalLocation,
      iflot.fltyp                    as FunctionalLocationCategory,
      // TODO-VERIFY[M] XFL-001: structure indicator field is IFLOT-TPLKZ
      iflot.tplkz                    as FuncLocationStructure,
      iflot.tplma                    as SuperiorFunctionalLocation,
      iflot.eqart                    as TechnicalObjectType,
      iflot.begru                    as AuthorizationGroup,
      iflot.iwerk                    as MaintenancePlanningPlant,
      iflot.ingrp                    as MaintenancePlannerGroup,
      // TODO-VERIFY[M] XFL-002: IFLOT-IEQUI (installation allowed) and IFLOT-EINZL (single installation)
      iflot.iequi                    as EquipInstallationIsAllowed,
      iflot.einzl                    as EquipIsSingleInstallation,
      // TODO-VERIFY[M] XFL-003: IFLOT carries the general data fields SUBMT, HERST, BAUJJ, INVNR, INBDT like EQUI
      iflot.submt                    as ConstructionType,
      iflot.herst                    as AssetManufacturerName,
      iflot.baujj                    as ConstructionYear,
      iflot.invnr                    as InventoryNumber,
      iflot.inbdt                    as OperationStartDate,
      iflot.objnr                    as ObjectNumber,
      // TODO-VERIFY[L] XFL-004: ILOA field names (SWERK, BEBER, STORT, MSGRP, ABCKZ, EQFNR, BUKRS, GSBER, KOKRS, KOSTL, ANLNR, ANLUN, DAUFN)
      iloa.swerk                     as MaintenancePlant,
      iloa.beber                     as PlantSection,
      iloa.stort                     as AssetLocation,
      iloa.msgrp                     as AssetRoom,
      iloa.abckz                     as ABCIndicator,
      iloa.eqfnr                     as SortField,
      iloa.bukrs                     as CompanyCode,
      iloa.gsber                     as BusinessArea,
      iloa.kokrs                     as ControllingArea,
      iloa.kostl                     as CostCenter,
      iloa.anlnr                     as MasterFixedAsset,
      iloa.anlun                     as FixedAsset,
      iloa.daufn                     as StandingOrder,
      case dlfl.stat when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      iflot.erdat                    as CreationDate,
      iflot.ernam                    as CreatedByUser,
      iflot.aedat                    as LastChangeDate
}
