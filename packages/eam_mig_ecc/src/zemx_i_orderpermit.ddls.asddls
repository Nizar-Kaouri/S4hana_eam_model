// ModuPorter EAM migration | Release 1.0.0
// Purpose: OrderPermit migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N54I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderPermit migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_OrderPermit
  as select from ZEMX_I_OrderPermitData as b
  association [0..1] to ZEMX_I_MaintOrder as _Business on _Business.ObjectNumber = $projection.ObjectNumber
{
      @EndUserText.label: 'Object Number'
  key b.ObjectNumber as ObjectNumber,
      @EndUserText.label: 'Permit'
  key b.Permit as Permit,
      @EndUserText.label: 'Maintenance Order'
      _Business.MaintenanceOrder as MaintenanceOrder
}
