// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionOperMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V004C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOperMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProductionOperMig
  as select from ZPPX_I_ProductionOper as src
{
  key src.OperationRoutingNumber as OperationRoutingNumber,
  key src.OperationInternalID as OperationInternalID,
      src.Operation as Operation,
      src.OperationText as OperationText,
      src.WorkCenterInternalID as WorkCenterInternalID,
      src.Plant as Plant
}
