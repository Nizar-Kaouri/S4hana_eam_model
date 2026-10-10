// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InfoPurchOrgMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V023C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoPurchOrgMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_InfoPurchOrgMig
  as select from ZMMX_I_InfoPurchOrg as src
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
