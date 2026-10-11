// ModuPorter EAM migration | Release 1.0.0
// Purpose: OrderPermit source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm IHSG keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N54B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderPermit source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_OrderPermitData
  as select from ihsg as t
{
      @EndUserText.label: 'Object Number'
  key t.objnr as ObjectNumber,
      @EndUserText.label: 'Permit'
  key t.pmps as Permit
}
