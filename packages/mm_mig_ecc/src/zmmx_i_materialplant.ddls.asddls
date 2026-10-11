// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MaterialPlant as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialPlant'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialPlant
  as select from ZMMX_B_MaterialPlantData as src
{
  key src.Product as Product,
  key src.Plant as Plant,
      src.MRPType as MRPType,
      src.MRPController as MRPController,
      src.ProcurementType as ProcurementType,
      src.PurchasingGroup as PurchasingGroup,
      src.DeletionFlag as DeletionFlag,
      src.MRPGroup as MRPGroup,
      src.LotSizingProcedure as LotSizingProcedure,
      src.SpecialProcurementType as SpecialProcurementType,
      src.AvailabilityCheck as AvailabilityCheck,
      src.SafetyStock as SafetyStock,
      src.MinimumLotSize as MinimumLotSize,
      src.MaximumLotSize as MaximumLotSize,
      src.FixedLotSize as FixedLotSize,
      src.PlannedDeliveryTime as PlannedDeliveryTime,
      src.GoodsReceiptProcessingTime as GoodsReceiptProcessingTime,
      src.InHouseProductionTime as InHouseProductionTime,
      src.IssueStorageLocation as IssueStorageLocation,
      src.ExternalProcStorageLocation as ExternalProcStorageLocation,
      src.SerialNumberProfile as SerialNumberProfile,
      src.BatchManagementRequired as BatchManagementRequired
}
