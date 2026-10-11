// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment partner assignments linked to an existing non-deleted current equipment master.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_EQPART'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment partner assignments'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipPartner
  as select from ZEMX_B_ObjectPartner as pa
    inner join ZEMX_I_Equipment as eq on eq.ObjectNumber = pa.ObjectNumber
{
      @EndUserText.label: 'Equipment'
  key eq.Equipment as Equipment,
      @EndUserText.label: 'Partner Function'
  key pa.PartnerFunction as PartnerFunction,
      @EndUserText.label: 'Partner Counter'
  key pa.PartnerCounter as PartnerCounter,
      @EndUserText.label: 'Partner'
      pa.Partner as Partner
}
where eq.IsMarkedForDeletion = '' and pa.IsMarkedForDeletion = ''
