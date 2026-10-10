// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectionLotCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMT-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectionLotCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZQMT_I_InspectionLotCompare
  as select from I_InspectionLot as src
{
  key src.InspectionLot as InspectionLot,
      src.Plant as Plant,
      src.Material as Material,
      src.Batch as Batch,
      src.InspectionType as InspectionType,
      src.InspectionLotOrigin as InspectionLotOrigin
}
