// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AssetAssignmenData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FAX-002: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFAX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetAssignmenData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFAX_I_AssetAssignmenData
  as select from anlz as src
{
  key src.bukrs as CompanyCode,
  key src.anln1 as MasterFixedAsset,
  key src.anln2 as FixedAsset,
  key src.bdatu as ValidityEndDate,
      src.adatu as ValidityStartDate,
      src.kostl as CostCenter,
      src.werks as Plant,
      src.stort as AssetLocation,
      src.gsber as BusinessArea
}
