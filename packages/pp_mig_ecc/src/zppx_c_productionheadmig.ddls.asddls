// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionHeadMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionHeadMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProductionHeadMig
  as select from ZPPX_I_ProductionHead as src
{
  key src.ManufacturingOrder as ManufacturingOrder,
      src.OperationRoutingNumber as OperationRoutingNumber,
      src.TotalQuantity as TotalQuantity,
      src.Unit as Unit,
      src.BasicStartDate as BasicStartDate,
      src.BasicEndDate as BasicEndDate
}
