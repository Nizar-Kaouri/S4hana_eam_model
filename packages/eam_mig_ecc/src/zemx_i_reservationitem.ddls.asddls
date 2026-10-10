// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Reservation / dependent requirement items (RESB) with order and operation link, material, quantities and flags.
// Example: Read the components of order 4000001.
@AbapCatalog.sqlViewName: 'ZEMX_RESB'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Reservation item'
@ObjectModel.representativeKey: 'ReservationItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_I_ReservationItem
  as select from resb
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
