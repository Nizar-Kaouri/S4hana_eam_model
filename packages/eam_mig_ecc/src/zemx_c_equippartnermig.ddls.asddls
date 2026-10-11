// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment child records in the same master scope; preserve their full keys.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_CEQPA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'EquipPartnerMig'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipPartnerMig
  as select from ZEMX_I_EquipPartner as src
{
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'Partner Function'
  key src.PartnerFunction as PartnerFunction,
      @EndUserText.label: 'Partner Counter'
  key src.PartnerCounter as PartnerCounter,
      @EndUserText.label: 'Partner'
      src.Partner as Partner
}
