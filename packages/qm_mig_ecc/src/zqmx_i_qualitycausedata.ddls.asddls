// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityCauseData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityCauseData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_QualityCauseData
  as select from qmur as src
{
  key src.qmnum as QualityNotification,
  key src.fenum as NotificationItem,
  key src.urnum as CauseNumber,
      src.urgrp as CauseCodeGroup,
      src.urcod as CauseCode,
      src.urtxt as CauseText
}
