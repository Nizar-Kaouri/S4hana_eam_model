// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_EquipmentTimeSegment
  as select from equz
  association [0..1] to ZEMX_I_LocAcctAssignment as _LocAcctAssignment on $projection.LocAcctAssignment = _LocAcctAssignment.LocAcctAssignment
  association [0..1] to ZEMX_I_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Equipment'
  key equz.equnr as Equipment,
      @EndUserText.label: 'Validity End Date'
  key equz.datbi as ValidityEndDate,
      // TODO-VERIFY[M] XEQ-006: EQUZ key EQUNR, DATBI, EQLFN
      @EndUserText.label: 'Time Segment Counter'
  key equz.eqlfn as TimeSegmentCounter,
      @EndUserText.label: 'Validity Start Date'
      equz.datab as ValidityStartDate,
      @EndUserText.label: 'Maintenance Planning Plant'
      equz.iwerk as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      equz.ingrp as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XEQ-002: EQUZ-GEWRK holds the CRHD object ID (OBJTY 'A') of the main work center
      @EndUserText.label: 'Main Work Center Internal ID'
      equz.gewrk as MainWorkCenterInternalID,
      @EndUserText.label: 'Superordinate Equipment'
      equz.hequi as SuperordinateEquipment,
      @EndUserText.label: 'Equip Installation Position Nmbr'
      equz.heqnr as EquipInstallationPositionNmbr,
      // TODO-VERIFY[M] XEQ-003: EQUZ-TIDNR is the technical identification number
      @EndUserText.label: 'Technical Identification Number'
      equz.tidnr as TechnicalIdentificationNumber,
      @EndUserText.label: 'Loc Acct Assignment'
      equz.iloan as LocAcctAssignment,
      _LocAcctAssignment,
      _MainWorkCenter
}
