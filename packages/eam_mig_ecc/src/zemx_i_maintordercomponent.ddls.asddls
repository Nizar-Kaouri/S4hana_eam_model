// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Material components (reservation items) of maintenance orders with operation link, requirement and withdrawn quantity.
// Example: Extract the open components: filter IsMarkedForDeletion = '' and IsFinalIssue = '' for the orders in scope.
@AbapCatalog.sqlViewName: 'ZEMX_ORC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance order component (migration extract)'
@ObjectModel.representativeKey: 'ReservationItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintOrderComponent
  as select from resb
    inner join afih on afih.aufnr = resb.aufnr
{
  key resb.rsnum as Reservation,
  key resb.rspos as ReservationItem,
  key resb.rsart as ReservationRecordType,
      resb.aufnr as MaintenanceOrder,
      resb.aufpl as OrderRoutingNumber,
      resb.aplzl as OrderOperationInternalID,
      // TODO-VERIFY[M] XOR-005: RESB field names POSNR, POSTP, BDTER, ENMNG, XLOEK, KZEAR
      resb.posnr as BOMItemNumber,
      resb.postp as BOMItemCategory,
      resb.matnr as Material,
      resb.werks as Plant,
      resb.lgort as StorageLocation,
      resb.bdter as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      resb.bdmng as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      resb.enmng as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      resb.meins as BaseUnit,
      resb.xloek as IsMarkedForDeletion,
      resb.kzear as IsFinalIssue
}
