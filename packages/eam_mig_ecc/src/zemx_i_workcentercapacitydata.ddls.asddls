// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: WorkCenterCapacity source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-52: Confirm CRCA keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N52B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WorkCenterCapacity source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_WorkCenterCapacityData
  as select from crca as t
{
      @EndUserText.label: 'Object Type'
  key t.objty as ObjectType,
      @EndUserText.label: 'Work Center Internal I D'
  key t.objid as WorkCenterInternalID,
      @EndUserText.label: 'Capacity Assignment'
  key t.canum as CapacityAssignment,
      @EndUserText.label: 'Capacity Internal I D'
      t.kapid as CapacityInternalID,
      @EndUserText.label: 'Validity Start Date'
      t.begda as ValidityStartDate,
      @EndUserText.label: 'Validity End Date'
      t.endda as ValidityEndDate,
      @EndUserText.label: 'Capacity Formula'
      t.fork2 as CapacityFormula
}
