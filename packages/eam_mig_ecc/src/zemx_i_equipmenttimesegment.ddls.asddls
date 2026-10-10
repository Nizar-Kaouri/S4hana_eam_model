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
  key equz.equnr as Equipment,
  key equz.datbi as ValidityEndDate,
      // TODO-VERIFY[M] XEQ-006: EQUZ key EQUNR, DATBI, EQLFN
  key equz.eqlfn as TimeSegmentCounter,
      equz.datab as ValidityStartDate,
      equz.iwerk as MaintenancePlanningPlant,
      equz.ingrp as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XEQ-002: EQUZ-GEWRK holds the CRHD object ID (OBJTY 'A') of the main work center
      equz.gewrk as MainWorkCenterInternalID,
      equz.hequi as SuperordinateEquipment,
      equz.heqnr as EquipInstallationPositionNmbr,
      // TODO-VERIFY[M] XEQ-003: EQUZ-TIDNR is the technical identification number
      equz.tidnr as TechnicalIdentificationNumber,
      equz.iloan as LocAcctAssignment,
      _LocAcctAssignment,
      _MainWorkCenter
}
