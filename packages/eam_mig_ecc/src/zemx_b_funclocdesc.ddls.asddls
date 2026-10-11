// ModuPorter EAM migration | Release 1.0.0
// Purpose: Functional location descriptions (IFLOTX) per language with the long-text indicator.
// Example: Read the German description of FL 1000-PUMP-01.
@AbapCatalog.sqlViewName: 'ZEMX_IFLOTX'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional location description'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_FuncLocDesc
  as select from iflotx
{
      @EndUserText.label: 'Functional Location'
  key iflotx.tplnr as FunctionalLocation,
      @Semantics.language: true
      @EndUserText.label: 'Language'
  key iflotx.spras as Language,
      @Semantics.text: true
      @EndUserText.label: 'Functional Location Name'
      iflotx.pltxt as FunctionalLocationName,
      @EndUserText.label: 'Has Long Text'
      iflotx.kzltx as HasLongText
}
