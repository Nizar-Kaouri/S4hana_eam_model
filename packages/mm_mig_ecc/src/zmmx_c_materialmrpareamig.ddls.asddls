// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_93N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'MaterialMRPAreaMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MaterialMRPAreaMig
  as select from ZMMX_I_MaterialMRPArea as src
{
  key src.Product as Product,
  key src.MRPArea as MRPArea,
      src.MRPType as MRPType,
      src.MRPController as MRPController,
      src.LotSizingProcedure as LotSizingProcedure,
      src.SpecialProcurementType as SpecialProcurementType,
      src.DeletionFlag as DeletionFlag
}
