// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location with hierarchy, category, planning data, location / account assignment and deletion flag: the complete business object.
// Example: Read the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000'.
// Alternative labeling (IFLOS) is not extracted: FunctionalLocation is the internal key TPLNR (see XFL-G01).
// TODO-VERIFY[H] XGEN-005: classic CDS on 7.40 SP08 accepts associations with $projection in the ON condition, path expressions with a data source alias (fl._LocAcctAssignment.X), path expressions inside CASE and in WHERE (consumption scope filters)
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
      fl._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      fl._LocAcctAssignment.PlantSection as PlantSection,
      fl._LocAcctAssignment.AssetLocation as AssetLocation,
      fl._LocAcctAssignment.AssetRoom as AssetRoom,
      fl._LocAcctAssignment.ABCIndicator as ABCIndicator,
      fl._LocAcctAssignment.SortField as SortField,
      fl._LocAcctAssignment.CompanyCode as CompanyCode,
      fl._LocAcctAssignment.BusinessArea as BusinessArea,
      fl._LocAcctAssignment.ControllingArea as ControllingArea,
      fl._LocAcctAssignment.CostCenter as CostCenter,
      fl._LocAcctAssignment.MasterFixedAsset as MasterFixedAsset,
      fl._LocAcctAssignment.FixedAsset as FixedAsset,
      fl._LocAcctAssignment.StandingOrder as StandingOrder,
      fl.ObjectNumber                as ObjectNumber,
      case fl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      fl.CreationDate                as CreationDate,
      fl.CreatedByUser               as CreatedByUser,
      fl.LastChangeDate              as LastChangeDate
}
