// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProdVersionData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-016: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProdVersionData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_ProdVersionData
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
