// ModuPorter MM migration | Release 1.0.0
// Purpose: Read RequisitionMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V015N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RequisitionMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_RequisitionMigCount
  as select from ZMMX_C_RequisitionMig as src
{
  key src.PurchaseRequisition as PurchaseRequisition,
      count( * ) as RecordCount
}
group by src.PurchaseRequisition
