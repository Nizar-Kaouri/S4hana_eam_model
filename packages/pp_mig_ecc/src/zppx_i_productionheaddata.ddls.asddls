// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionHeadData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-002: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionHeadData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_ProductionHeadData
  as select from afko as src
{
  key src.aufnr as ManufacturingOrder,
      src.aufpl as OperationRoutingNumber,
      src.gamng as TotalQuantity,
      src.gmein as Unit,
      src.gstrp as BasicStartDate,
      src.gltrp as BasicEndDate
}
