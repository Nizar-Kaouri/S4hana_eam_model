// ModuPorter CO migration | Release 1.0.0
// Purpose: Read InternalOrderData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InternalOrderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_InternalOrderData
  as select from aufk as src
{
  key src.aufnr as InternalOrder,
      src.auart as InternalOrderType,
      src.autyp as OrderCategory,
      src.ktext as InternalOrderDescription,
      src.bukrs as CompanyCode,
      src.kokrs as ControllingArea,
      src.kostv as ResponsibleCostCenter,
      src.prctr as ProfitCenter,
      src.objnr as ObjectNumber
}
