// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Quality notification cube: all and open notifications per type, plant, material, supplier, customer
//   and month.
// Example: Supplier complaints per month; open customer complaints per plant.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Quality Notification - Cube'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZQMV_I_QualityNotif
  as select from ZQMV_B_QualityNotif
  association [1..1] to ZQMV_B_QualityNotif as _QualityNotification on $projection.QualityNotification = _QualityNotification.QualityNotification
{
      @ObjectModel.foreignKey.association: '_QualityNotification'
  key QualityNotification,
      NotificationType,
      NotificationPriority,
      NotifProcessingPhase,
      QualityNotifIsOpen,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      Supplier,
      Customer,
      CreationDate,
      @EndUserText.label: 'Creation Year/Month'
      cast( substring( CreationDate, 1, 6 ) as abap.numc( 6 ) ) as CreationYearMonth,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Quality Notifications'
      cast( 1 as abap.int4 ) as NumberOfQualityNotifs,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Open Quality Notifications'
      cast( case when QualityNotifIsOpen = 'X' then 1 else 0 end as abap.int4 ) as NumberOfOpenQualityNotifs,

      /* Associations */
      _Plant,
      _QualityNotification
}
