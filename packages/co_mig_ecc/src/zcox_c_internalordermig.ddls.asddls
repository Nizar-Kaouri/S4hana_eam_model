// ModuPorter CO migration | Release 1.0.0
// Purpose: Read InternalOrderMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InternalOrderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_InternalOrderMig
  as select from ZCOX_I_InternalOrder as src
{
  key src.InternalOrder as InternalOrder,
      src.InternalOrderType as InternalOrderType,
      src.OrderCategory as OrderCategory,
      src.InternalOrderDescription as InternalOrderDescription,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea,
      src.ResponsibleCostCenter as ResponsibleCostCenter,
      src.ProfitCenter as ProfitCenter,
      src.ObjectNumber as ObjectNumber
}
