// ModuPorter EAM migration | Release 1.0.0
// Purpose: Characteristic names by internal number (current version): the name is the key used on S/4HANA, the internal number differs.
// Example: Find the name of characteristic 0000000815.
// Compatibility note: CABN rows of characteristics without engineering change management have ADZHL = '0000'
@AbapCatalog.sqlViewName: 'ZEMX_CABN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Characteristic'
@ObjectModel.representativeKey: 'CharcInternalID'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_B_Characteristic
  as select from cabn
{
      @EndUserText.label: 'Charc Internal ID'
  key cabn.atinn as CharcInternalID,
      @EndUserText.label: 'Characteristic'
      cabn.atnam as Characteristic
}
where cabn.adzhl = '0000'
