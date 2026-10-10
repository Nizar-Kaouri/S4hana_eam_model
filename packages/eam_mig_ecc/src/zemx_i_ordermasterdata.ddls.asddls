// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Order master data (AUFK) of maintenance orders (order category 30).
// Example: Read the maintenance orders of company code 1000.
// TODO-VERIFY[M] XOR-003: maintenance orders have order category AUFK-AUTYP = '30'
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
define view ZEMX_I_OrderMasterData
  as select from aufk
  association [0..1] to ZEMX_I_StatusTechCompleted as _TechCompletedFlag on $projection.ObjectNumber = _TechCompletedFlag.ObjectNumber
  association [0..1] to ZEMX_I_StatusClosed as _ClosedFlag on $projection.ObjectNumber = _ClosedFlag.ObjectNumber
  association [0..1] to ZEMX_I_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
  key aufk.aufnr as MaintenanceOrder,
      aufk.auart as MaintenanceOrderType,
      aufk.ktext as MaintenanceOrderDesc,
      aufk.bukrs as CompanyCode,
      aufk.gsber as BusinessArea,
      aufk.kokrs as ControllingArea,
      aufk.kostv as ResponsibleCostCenter,
      aufk.waers as Currency,
      aufk.objnr as ObjectNumber,
      aufk.erdat as CreationDate,
      aufk.ernam as CreatedByUser,
      aufk.aedat as LastChangeDate,
      _TechCompletedFlag,
      _ClosedFlag,
      _DeletionFlag
}
where aufk.autyp = '30'
