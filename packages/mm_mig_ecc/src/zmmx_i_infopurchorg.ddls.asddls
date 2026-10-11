// ModuPorter MM migration | Release 1.0.0
// Purpose: Read InfoPurchOrg as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V023R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoPurchOrg'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_InfoPurchOrg
  as select from ZMMX_I_InfoPurchOrgData as src
{
  key src.PurchasingInfoRecord as PurchasingInfoRecord,
  key src.PurchasingOrganization as PurchasingOrganization,
  key src.InfoRecordCategory as InfoRecordCategory,
  key src.Plant as Plant,
      src.PurchasingGroup as PurchasingGroup,
      src.Currency as Currency,
      src.NetPrice as NetPrice,
      src.PriceUnit as PriceUnit,
      src.PriceUnitOfMeasure as PriceUnitOfMeasure,
      src.DeletionFlag as DeletionFlag
}
