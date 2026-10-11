// ModuPorter EAM migration | Release 1.0.0
// Purpose: Functional location with hierarchy, category, planning data, location / account assignment and deletion flag: the complete business object.
// Example: Read the hierarchy of plant 1000 top-down: filter MaintenancePlanningPlant = '1000'.
// Alternative labeling (IFLOS) is not extracted: FunctionalLocation is the internal key TPLNR (see XFL-G01).
// Compatibility note: classic CDS on 7.40 SP08 accepts associations with $projection in the ON condition, path expressions with a data source alias (fl._LocAcctAssignment.X), path expressions inside CASE and in WHERE (consumption scope filters)
// Compatibility note: the header change date (AEDAT) is also set when ILOA / status change; otherwise the delta misses those changes (plan a full reload at cutover)
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
      @EndUserText.label: 'Functional Location'
  key fl.FunctionalLocation          as FunctionalLocation,
      @EndUserText.label: 'Functional Location Category'
      fl.FunctionalLocationCategory  as FunctionalLocationCategory,
      @EndUserText.label: 'Func Location Structure'
      fl.FuncLocationStructure       as FuncLocationStructure,
      @EndUserText.label: 'Superior Functional Location'
      fl.SuperiorFunctionalLocation  as SuperiorFunctionalLocation,
      @EndUserText.label: 'Technical Object Type'
      fl.TechnicalObjectType         as TechnicalObjectType,
      @EndUserText.label: 'Authorization Group'
      fl.AuthorizationGroup          as AuthorizationGroup,
      @EndUserText.label: 'Maintenance Planning Plant'
      fl.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      fl.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      @EndUserText.label: 'Equip Installation Is Allowed'
      fl.EquipInstallationIsAllowed  as EquipInstallationIsAllowed,
      @EndUserText.label: 'Equip Is Single Installation'
      fl.EquipIsSingleInstallation   as EquipIsSingleInstallation,
      @EndUserText.label: 'Construction Type'
      fl.ConstructionType            as ConstructionType,
      @EndUserText.label: 'Asset Manufacturer Name'
      fl.AssetManufacturerName       as AssetManufacturerName,
      @EndUserText.label: 'Construction Year'
      fl.ConstructionYear            as ConstructionYear,
      @EndUserText.label: 'Inventory Number'
      fl.InventoryNumber             as InventoryNumber,
      @EndUserText.label: 'Operation Start Date'
      fl.OperationStartDate          as OperationStartDate,
      @EndUserText.label: 'Maintenance Plant'
      fl._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      @EndUserText.label: 'Plant Section'
      fl._LocAcctAssignment.PlantSection as PlantSection,
      @EndUserText.label: 'Asset Location'
      fl._LocAcctAssignment.AssetLocation as AssetLocation,
      @EndUserText.label: 'Asset Room'
      fl._LocAcctAssignment.AssetRoom as AssetRoom,
      @EndUserText.label: 'ABCIndicator'
      fl._LocAcctAssignment.ABCIndicator as ABCIndicator,
      @EndUserText.label: 'Sort Field'
      fl._LocAcctAssignment.SortField as SortField,
      @EndUserText.label: 'Company Code'
      fl._LocAcctAssignment.CompanyCode as CompanyCode,
      @EndUserText.label: 'Business Area'
      fl._LocAcctAssignment.BusinessArea as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      fl._LocAcctAssignment.ControllingArea as ControllingArea,
      @EndUserText.label: 'Cost Center'
      fl._LocAcctAssignment.CostCenter as CostCenter,
      @EndUserText.label: 'Master Fixed Asset'
      fl._LocAcctAssignment.MasterFixedAsset as MasterFixedAsset,
      @EndUserText.label: 'Fixed Asset'
      fl._LocAcctAssignment.FixedAsset as FixedAsset,
      @EndUserText.label: 'Standing Order'
      fl._LocAcctAssignment.StandingOrder as StandingOrder,
      @EndUserText.label: 'Object Number'
      fl.ObjectNumber                as ObjectNumber,
      @EndUserText.label: 'Is Marked For Deletion'
      case fl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      fl.CreationDate                as CreationDate,
      @EndUserText.label: 'Created By User'
      fl.CreatedByUser               as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      fl.LastChangeDate              as LastChangeDate
}
