// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per equipment (current time segment) with installation location, superordinate equipment, main work center, location / account assignment and manufacturer data; source for the equipment migration object.
// Example: Extract the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000', load superordinate equipment first.
// Earlier time segments (installation history) are not migrated; see the S/4HANA product eam for history reporting.
@AbapCatalog.sqlViewName: 'ZEMX_EQ'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Equipment (migration extract)'
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_Equipment
  as select from equi
    inner join equz on equz.equnr = equi.equnr
    left outer join iloa on iloa.iloan = equz.iloan
    left outer join crhd as wc on wc.objid = equz.gewrk and wc.objty = 'A'
    left outer join jest as dlfl on dlfl.objnr = equi.objnr and dlfl.stat = 'I0076' and dlfl.inact = ''
{
  key equi.equnr                     as Equipment,
      equi.eqtyp                     as EquipmentCategory,
      equi.eqart                     as TechnicalObjectType,
      equi.begru                     as AuthorizationGroup,
      // TODO-VERIFY[H] XEQ-001: the current time segment of EQUZ has DATBI = '99991231'
      equz.datab                     as ValidityStartDate,
      equz.iwerk                     as MaintenancePlanningPlant,
      equz.ingrp                     as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XEQ-002: EQUZ-GEWRK holds the CRHD object ID (OBJTY 'A') of the main work center
      wc.arbpl                       as MainWorkCenter,
      wc.werks                       as MainWorkCenterPlant,
      iloa.tplnr                     as FunctionalLocation,
      equz.hequi                     as SuperordinateEquipment,
      equz.heqnr                     as EquipInstallationPositionNmbr,
      // TODO-VERIFY[M] XEQ-003: EQUZ-TIDNR is the technical identification number
      equz.tidnr                     as TechnicalIdentificationNumber,
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
      equi.matnr                     as Material,
      equi.sernr                     as SerialNumber,
      equi.herst                     as AssetManufacturerName,
      // TODO-VERIFY[M] XEQ-004: EQUI field names HERLD, TYPBZ, MAPAR, SERGE, BAUMM, INBDT, GROES
      equi.herld                     as ManufacturerCountry,
      equi.typbz                     as ManufacturerModelNumber,
      equi.mapar                     as ManufacturerPartNmbr,
      equi.serge                     as ManufacturerSerialNumber,
      equi.baujj                     as ConstructionYear,
      equi.baumm                     as ConstructionMonth,
      equi.invnr                     as InventoryNumber,
      equi.inbdt                     as OperationStartDate,
      equi.groes                     as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      equi.brgew                     as GrossWeight,
      @Semantics.unitOfMeasure: true
      equi.gewei                     as WeightUnit,
      equi.ansdt                     as AcquisitionDate,
      // TODO-VERIFY[M] XEQ-005: EQUI-WAERS is the currency key of EQUI-ANSWT
      @Semantics.amount.currencyCode: 'Currency'
      equi.answt                     as AcquisitionValue,
      @Semantics.currencyCode: true
      equi.waers                     as Currency,
      equi.objnr                     as ObjectNumber,
      case dlfl.stat when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      equi.erdat                     as CreationDate,
      equi.ernam                     as CreatedByUser,
      equi.aedat                     as LastChangeDate
}
where equz.datbi = '99991231'
