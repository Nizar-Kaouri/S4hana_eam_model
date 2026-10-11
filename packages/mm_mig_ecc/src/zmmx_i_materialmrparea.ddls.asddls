// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_92N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialMRPArea'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialMRPArea
  as select from ZMMX_B_MaterialMRPAreaData as ch
    inner join ZMMX_I_Material as obj on ch.Product = obj.Product
{
  key ch.Product as Product,
  key ch.MRPArea as MRPArea,
      ch.MRPType as MRPType,
      ch.MRPController as MRPController,
      ch.LotSizingProcedure as LotSizingProcedure,
      ch.SpecialProcurementType as SpecialProcurementType,
      ch.DeletionFlag as DeletionFlag
}
