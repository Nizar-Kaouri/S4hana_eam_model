// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityTaskData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityTaskData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_QualityTaskData
  as select from qmsm as src
{
  key src.qmnum as QualityNotification,
  key src.manum as TaskNumber,
      src.mngrp as TaskCodeGroup,
      src.mncod as TaskCode,
      src.matxt as TaskText
}
