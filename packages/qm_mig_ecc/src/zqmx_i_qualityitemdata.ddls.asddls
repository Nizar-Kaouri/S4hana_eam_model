// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityItemData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_QualityItemData
  as select from qmfe as src
{
  key src.qmnum as QualityNotification,
  key src.fenum as NotificationItem,
      src.fegrp as DefectCodeGroup,
      src.fecod as DefectCode,
      src.fetxt as DefectText
}
