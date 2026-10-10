// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional location descriptions in every maintained language and the long-text indicator.
// Example: Extract all texts of the locations in scope: join on FunctionalLocation with ZEMX_I_FuncLoc.
@AbapCatalog.sqlViewName: 'ZEMX_FLT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location text (migration extract)'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_FuncLocText
  as select from iflotx
{
  key iflotx.tplnr as FunctionalLocation,
      @Semantics.language: true
  key iflotx.spras as Language,
      @Semantics.text: true
      iflotx.pltxt as FunctionalLocationName,
      iflotx.kzltx as HasLongText
}
