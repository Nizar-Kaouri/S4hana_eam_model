// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_91N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialMRPAreaData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_MaterialMRPAreaData
  as select from mdma as src
{
  key src.matnr as Product,
  key src.berid as MRPArea,
      src.dismm as MRPType,
      src.dispo as MRPController,
      src.disls as LotSizingProcedure,
      src.sobsl as SpecialProcurementType,
      src.loekz as DeletionFlag
}
