// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation.
// Purpose: Read WarehouseTaskCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseTaskCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WarehouseTaskCompare
  as select from /scwm/ordim_o as src
{
  key src.lgnum as Warehouse,
  key src.tanum as WarehouseTask,
      src.who as WarehouseOrder,
      src.tostat as TaskStatus,
      src.created_by as CreatedBy,
      src.aarea as ActivityArea,
      src.vltyp as SourceStorageType,
      src.nltyp as TargetStorageType,
      src.nlber as TargetStorageSection,
      src.owner as Owner,
      src.owner_role as OwnerRole,
      src.meins as Unit
}
