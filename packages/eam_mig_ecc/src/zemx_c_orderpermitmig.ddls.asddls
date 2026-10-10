// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: OrderPermit migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N54C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'OrderPermit migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_OrderPermitMig
  as select from ZEMX_I_OrderPermit as src
  association [0..1] to ZEMX_I_MaintOrder as _Parent on _Parent.ObjectNumber = $projection.ObjectNumber
{
      @EndUserText.label: 'Object Number'
  key src.ObjectNumber as ObjectNumber,
      @EndUserText.label: 'Permit'
  key src.Permit as Permit,
      @EndUserText.label: 'Maintenance Order'
      src.MaintenanceOrder as MaintenanceOrder
}
where _Parent.IsClosed = '' and _Parent.IsTechnicallyCompleted = '' and _Parent.IsMarkedForDeletion = ''
