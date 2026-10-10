// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location with hierarchy, category, planning data, location / account assignment and deletion flag: the complete business object.
// Example: Read the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000'.
// Alternative labeling (IFLOS) is not extracted: FunctionalLocation is the internal key TPLNR (see XFL-G01).
// TODO-VERIFY[M] XGEN-003: the header change date (AEDAT) is also set when ILOA / status change; otherwise the delta misses those changes (plan a full reload at cutover)
@AbapCatalog.sqlViewName: 'ZEMX_FL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional location'
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLoc
  as select from ZEMX_I_FuncLocHeader as fl
    left outer join ZEMX_I_LocAcctAssignment as loc on loc.LocAcctAssignment = fl.LocAcctAssignment
    left outer join ZEMX_I_StatusDeletionFlag as dlfl on dlfl.ObjectNumber = fl.ObjectNumber
{
  key fl.FunctionalLocation          as FunctionalLocation,
      fl.FunctionalLocationCategory  as FunctionalLocationCategory,
      fl.FuncLocationStructure       as FuncLocationStructure,
      fl.SuperiorFunctionalLocation  as SuperiorFunctionalLocation,
      fl.TechnicalObjectType         as TechnicalObjectType,
      fl.AuthorizationGroup          as AuthorizationGroup,
      fl.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      fl.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      fl.EquipInstallationIsAllowed  as EquipInstallationIsAllowed,
      fl.EquipIsSingleInstallation   as EquipIsSingleInstallation,
      fl.ConstructionType            as ConstructionType,
      fl.AssetManufacturerName       as AssetManufacturerName,
      fl.ConstructionYear            as ConstructionYear,
      fl.InventoryNumber             as InventoryNumber,
      fl.OperationStartDate          as OperationStartDate,
      loc.MaintenancePlant           as MaintenancePlant,
      loc.PlantSection               as PlantSection,
      loc.AssetLocation              as AssetLocation,
      loc.AssetRoom                  as AssetRoom,
      loc.ABCIndicator               as ABCIndicator,
      loc.SortField                  as SortField,
      loc.CompanyCode                as CompanyCode,
      loc.BusinessArea               as BusinessArea,
      loc.ControllingArea            as ControllingArea,
      loc.CostCenter                 as CostCenter,
      loc.MasterFixedAsset           as MasterFixedAsset,
      loc.FixedAsset                 as FixedAsset,
      loc.StandingOrder              as StandingOrder,
      fl.ObjectNumber                as ObjectNumber,
      case dlfl.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      fl.CreationDate                as CreationDate,
      fl.CreatedByUser               as CreatedByUser,
      fl.LastChangeDate              as LastChangeDate
}
