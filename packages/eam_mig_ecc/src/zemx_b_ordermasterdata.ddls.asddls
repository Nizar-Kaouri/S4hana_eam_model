// ModuPorter EAM migration | Release 1.0.0
// Purpose: Order master data (AUFK) of maintenance orders (order category 30).
// Example: Read the maintenance orders of company code 1000.
// Compatibility note: maintenance orders have order category AUFK-AUTYP = '30'
@AbapCatalog.sqlViewName: 'ZEMX_AUFK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Order master data'
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_OrderMasterData
  as select from aufk
  association [0..1] to ZEMX_B_StatusTechCompleted as _TechCompletedFlag on $projection.ObjectNumber = _TechCompletedFlag.ObjectNumber
  association [0..1] to ZEMX_B_StatusClosed as _ClosedFlag on $projection.ObjectNumber = _ClosedFlag.ObjectNumber
  association [0..1] to ZEMX_B_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
      @EndUserText.label: 'Maintenance Order'
  key aufk.aufnr as MaintenanceOrder,
      @EndUserText.label: 'Maintenance Order Type'
      aufk.auart as MaintenanceOrderType,
      @EndUserText.label: 'Maintenance Order Desc'
      aufk.ktext as MaintenanceOrderDesc,
      @EndUserText.label: 'Company Code'
      aufk.bukrs as CompanyCode,
      @EndUserText.label: 'Business Area'
      aufk.gsber as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      aufk.kokrs as ControllingArea,
      @EndUserText.label: 'Responsible Cost Center'
      aufk.kostv as ResponsibleCostCenter,
      @EndUserText.label: 'Currency'
      aufk.waers as Currency,
      @EndUserText.label: 'Object Number'
      aufk.objnr as ObjectNumber,
      @EndUserText.label: 'Creation Date'
      aufk.erdat as CreationDate,
      @EndUserText.label: 'Created By User'
      aufk.ernam as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      aufk.aedat as LastChangeDate,
      _TechCompletedFlag,
      _ClosedFlag,
      _DeletionFlag
}
where aufk.autyp = '30'
