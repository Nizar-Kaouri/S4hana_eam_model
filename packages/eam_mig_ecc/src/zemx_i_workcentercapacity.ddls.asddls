// ModuPorter EAM migration | Release 1.0.0
// Purpose: WorkCenterCapacity migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N52I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WorkCenterCapacity migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_WorkCenterCapacity
  as select from ZEMX_I_WorkCenterCapacityData as b
  association [0..1] to ZEMX_I_WorkCenterHeader as _Business on _Business.WorkCenterInternalID = $projection.WorkCenterInternalID
{
      @EndUserText.label: 'Object Type'
  key b.ObjectType as ObjectType,
      @EndUserText.label: 'Work Center Internal I D'
  key b.WorkCenterInternalID as WorkCenterInternalID,
      @EndUserText.label: 'Capacity Assignment'
  key b.CapacityAssignment as CapacityAssignment,
      @EndUserText.label: 'Capacity Internal I D'
      b.CapacityInternalID as CapacityInternalID,
      @EndUserText.label: 'Validity Start Date'
      b.ValidityStartDate as ValidityStartDate,
      @EndUserText.label: 'Validity End Date'
      b.ValidityEndDate as ValidityEndDate,
      @EndUserText.label: 'Capacity Formula'
      b.CapacityFormula as CapacityFormula,
      @EndUserText.label: 'Work Center'
      _Business.WorkCenter as WorkCenter
}
