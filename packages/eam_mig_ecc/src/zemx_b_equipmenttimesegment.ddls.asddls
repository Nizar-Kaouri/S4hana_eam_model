// ModuPorter EAM migration | Release 1.0.0
// Purpose: Time segments of equipment (EQUZ): planning plant, planner group, main work center, superordinate equipment and location record per validity period.
// Example: Read the installation history of equipment 10000001 (all segments).
@AbapCatalog.sqlViewName: 'ZEMX_EQUZ'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment time segment'
@ObjectModel.representativeKey: 'TimeSegmentCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_B_EquipmentTimeSegment
  as select from equz
  association [0..1] to ZEMX_B_LocAcctAssignment as _LocAcctAssignment on $projection.LocAcctAssignment = _LocAcctAssignment.LocAcctAssignment
  association [0..1] to ZEMX_B_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Equipment'
  key equz.equnr as Equipment,
      @EndUserText.label: 'Validity End Date'
  key equz.datbi as ValidityEndDate,
      // Compatibility note: EQUZ key EQUNR, DATBI, EQLFN
      @EndUserText.label: 'Time Segment Counter'
  key equz.eqlfn as TimeSegmentCounter,
      @EndUserText.label: 'Validity Start Date'
      equz.datab as ValidityStartDate,
      @EndUserText.label: 'Maintenance Planning Plant'
      equz.iwerk as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      equz.ingrp as MaintenancePlannerGroup,
      // Compatibility note: EQUZ-GEWRK holds the CRHD object ID (OBJTY 'A') of the main work center
      @EndUserText.label: 'Main Work Center Internal ID'
      equz.gewrk as MainWorkCenterInternalID,
      @EndUserText.label: 'Superordinate Equipment'
      equz.hequi as SuperordinateEquipment,
      @EndUserText.label: 'Equip Installation Position Nmbr'
      equz.heqnr as EquipInstallationPositionNmbr,
      // Compatibility note: EQUZ-TIDNR is the technical identification number
      @EndUserText.label: 'Technical Identification Number'
      equz.tidnr as TechnicalIdentificationNumber,
      @EndUserText.label: 'Loc Acct Assignment'
      equz.iloan as LocAcctAssignment,
      _LocAcctAssignment,
      _MainWorkCenter
}
