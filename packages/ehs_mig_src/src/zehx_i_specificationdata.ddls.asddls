// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Classic specification model. Preserve all change states; no unverified latest-record rule.
// Purpose: Read SpecificationData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecificationData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_SpecificationData
  as select from estrh as src
{
  key src.recn as RecordNumber,
  key src.actn as ChangeState,
      src.valfr as ValidFrom,
      src.valto as ValidTo,
      src.delflg as DeletionFlag,
      src.subid as SpecificationID,
      src.subcat as SpecificationCategory,
      src.authgrp as AuthorizationGroup,
      src.rem as Remark
}
