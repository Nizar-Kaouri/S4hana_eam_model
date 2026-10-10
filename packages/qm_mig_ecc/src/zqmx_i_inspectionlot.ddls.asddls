// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectionLot as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectionLot'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_InspectionLot
  as select from ZQMX_I_InspectionLotData as src
{
  key src.InspectionLot as InspectionLot,
      src.Plant as Plant,
      src.Material as Material,
      src.Batch as Batch,
      src.InspectionType as InspectionType,
      src.InspectionLotOrigin as InspectionLotOrigin,
      src.InspectionLotQuantity as InspectionLotQuantity,
      src.Unit as Unit,
      src.ObjectNumber as ObjectNumber
}
