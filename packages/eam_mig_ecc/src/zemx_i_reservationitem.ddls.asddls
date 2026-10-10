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
  association [0..1] to ZEMX_I_OrderOperationData as _Operation on $projection.OrderRoutingNumber = _Operation.OrderRoutingNumber and $projection.OrderOperationInternalID = _Operation.OrderOperationInternalID
{
      @EndUserText.label: 'Reservation'
  key resb.rsnum as Reservation,
      @EndUserText.label: 'Reservation Item'
  key resb.rspos as ReservationItem,
      @EndUserText.label: 'Reservation Record Type'
  key resb.rsart as ReservationRecordType,
      @EndUserText.label: 'Maintenance Order'
      resb.aufnr as MaintenanceOrder,
      @EndUserText.label: 'Order Routing Number'
      resb.aufpl as OrderRoutingNumber,
      @EndUserText.label: 'Order Operation Internal ID'
      resb.aplzl as OrderOperationInternalID,
      // TODO-VERIFY[M] XOR-005: RESB field names POSNR, POSTP, BDTER, ENMNG, XLOEK, KZEAR
      @EndUserText.label: 'BOMItem Number'
      resb.posnr as BOMItemNumber,
      @EndUserText.label: 'BOMItem Category'
      resb.postp as BOMItemCategory,
      @EndUserText.label: 'Material'
      resb.matnr as Material,
      @EndUserText.label: 'Plant'
      resb.werks as Plant,
      @EndUserText.label: 'Storage Location'
      resb.lgort as StorageLocation,
      @EndUserText.label: 'Matl Comp Requirement Date'
      resb.bdter as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'Requirement Quantity In Base Unit'
      resb.bdmng as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'Withdrawn Quantity'
      resb.enmng as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Base Unit'
      resb.meins as BaseUnit,
      @EndUserText.label: 'Is Marked For Deletion'
      resb.xloek as IsMarkedForDeletion,
      @EndUserText.label: 'Is Final Issue'
      resb.kzear as IsFinalIssue,
      _Operation
}
