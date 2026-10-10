// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per notification with a malfunction start: malfunction period, breakdown flag,
//   closed flag and the computed downtime in hours (only when start and end are maintained).
// Example: Basis for downtime / breakdown analysis and for the MTBF / MTTR report.
// Module rpt_downtime has a hard dependency on maintenance_notification.
// TODO-VERIFY[M] RPT-D01: dats_tims_to_tstmp / tstmp_seconds_between / abap_system_timezone signatures and on_error values in a view entity
// TODO-VERIFY[L] RPT-D02: open malfunctions (no end date) get downtime 0 - confirm this is the wanted business rule
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Notification Downtime'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_NotifDowntime
  as select from ZEAM_I_MaintNotif
{
  key MaintenanceNotification,
      NotificationType,
      MaintPriority,
      MaintenanceObjectIsDown,
      MalfunctionStartDate,
      MalfunctionStartTime,
      MalfunctionEndDate,
      MalfunctionEndTime,
      cast( case when MalfunctionEndDate = '00000000' then ' ' else 'X' end as abap_boolean ) as MalfunctionIsClosed,
      cast( case when MalfunctionEndDate <> '00000000'
                 then division( tstmp_seconds_between(
                        dats_tims_to_tstmp( MalfunctionStartDate, MalfunctionStartTime,
                                            abap_system_timezone( $session.client, 'NULL' ), $session.client, 'NULL' ),
                        dats_tims_to_tstmp( MalfunctionEndDate, MalfunctionEndTime,
                                            abap_system_timezone( $session.client, 'NULL' ), $session.client, 'NULL' ),
                        'NULL' ), 3600, 2 )
                 else 0 end as abap.dec( 15, 2 ) ) as DowntimeInHours,
      Equipment,
      FunctionalLocation,
      MaintenanceOrder,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      PlantSection,
      MainWorkCenter
}
where
  MalfunctionStartDate <> '00000000'
