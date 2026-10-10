// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Classic specification model. Preserve all change states; no unverified latest-record rule.
// Purpose: Read Specification as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Specification'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_Specification
  as select from ZEHX_I_SpecificationData as src
{
  key src.RecordNumber as RecordNumber,
  key src.ChangeState as ChangeState,
      src.ValidFrom as ValidFrom,
      src.ValidTo as ValidTo,
      src.DeletionFlag as DeletionFlag,
      src.SpecificationID as SpecificationID,
      src.SpecificationCategory as SpecificationCategory,
      src.AuthorizationGroup as AuthorizationGroup,
      src.Remark as Remark
}
