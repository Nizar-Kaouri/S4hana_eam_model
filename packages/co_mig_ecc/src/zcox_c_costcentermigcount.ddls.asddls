// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostCenterMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V001N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostCenterMigCount
  as select from ZCOX_C_CostCenterMig as src
{
  key src.ControllingArea as ControllingArea,
      count( * ) as RecordCount
}
group by src.ControllingArea
