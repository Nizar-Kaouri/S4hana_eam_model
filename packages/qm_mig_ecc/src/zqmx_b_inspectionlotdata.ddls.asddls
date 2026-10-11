// ModuPorter QM migration | Release 1.0.0
// Purpose: Read InspectionLotData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectionLotData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_B_InspectionLotData
  as select from qals as src
{
  key src.prueflos as InspectionLot,
      src.werk as Plant,
      src.matnr as Material,
      src.charg as Batch,
      src.art as InspectionType,
      src.herkunft as InspectionLotOrigin,
      src.losmenge as InspectionLotQuantity,
      src.mengeneinh as Unit,
      src.objnr as ObjectNumber
}
