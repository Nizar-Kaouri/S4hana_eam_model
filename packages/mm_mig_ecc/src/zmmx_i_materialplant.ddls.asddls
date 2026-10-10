// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialPlant as source candidates; approve the key-date population before posting.
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
  as select from ZMMX_I_MaterialPlantData as src
{
  key src.Product as Product,
  key src.Plant as Plant,
      src.MRPType as MRPType,
      src.MRPController as MRPController,
      src.ProcurementType as ProcurementType,
      src.PurchasingGroup as PurchasingGroup,
      src.DeletionFlag as DeletionFlag
}
