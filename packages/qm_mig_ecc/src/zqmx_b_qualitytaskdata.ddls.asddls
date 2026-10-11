// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityTaskData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityTaskData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_B_QualityTaskData
  as select from qmsm as src
{
  key src.qmnum as QualityNotification,
  key src.manum as TaskNumber,
      src.mngrp as TaskCodeGroup,
      src.mncod as TaskCode,
      src.matxt as TaskText
}
