// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProdVersionData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProdVersionData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_B_ProdVersionData
  as select from mkal as src
{
  key src.matnr as Product,
  key src.werks as Plant,
  key src.verid as ProductionVersion,
      src.text1 as ProductionVersionText,
      src.adatu as ValidityStartDate,
      src.bdatu as ValidityEndDate,
      src.bstmi as MinimumLotSize,
      src.bstma as MaximumLotSize,
      src.stlal as BOMAlternative,
      src.stlan as BOMUsage,
      src.plnty as TaskListType,
      src.plnnr as TaskListGroup,
      src.alnal as TaskListGroupCounter,
      src.mksp as ProductionVersionLock
}
