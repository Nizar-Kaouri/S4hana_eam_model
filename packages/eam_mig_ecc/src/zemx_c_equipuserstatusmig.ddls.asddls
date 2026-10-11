// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment child records in the same master scope; preserve their full keys.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_CEQUS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'EquipUserStatusMig'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipUserStatusMig
  as select from ZEMX_I_EquipStatus as src
{
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'Status Code'
  key src.StatusCode as StatusCode,
      @EndUserText.label: 'Status Kind'
      src.StatusKind as StatusKind,
      @EndUserText.label: 'Status Profile'
      src.StatusProfile as StatusProfile,
      @EndUserText.label: 'Status Change Number'
      src.StatusChangeNumber as StatusChangeNumber
}
where src.StatusKind = 'E'
