// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: WorkCenterCapacity migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N52C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'WorkCenterCapacity migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterCapacityMig
  as select from ZEMX_I_WorkCenterCapacity as src
  association [0..1] to ZEMX_I_WorkCenterHeader as _Parent on _Parent.WorkCenterInternalID = $projection.WorkCenterInternalID
{
      @EndUserText.label: 'Object Type'
  key src.ObjectType as ObjectType,
      @EndUserText.label: 'Work Center Internal I D'
  key src.WorkCenterInternalID as WorkCenterInternalID,
      @EndUserText.label: 'Capacity Assignment'
  key src.CapacityAssignment as CapacityAssignment,
      @EndUserText.label: 'Capacity Internal I D'
      src.CapacityInternalID as CapacityInternalID,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Validity End Date'
      src.ValidityEndDate as ValidityEndDate,
      @EndUserText.label: 'Capacity Formula'
      src.CapacityFormula as CapacityFormula,
      @EndUserText.label: 'Work Center'
      src.WorkCenter as WorkCenter
}
where src.ObjectType = 'A' and _Parent.IsMarkedForDeletion = ''
