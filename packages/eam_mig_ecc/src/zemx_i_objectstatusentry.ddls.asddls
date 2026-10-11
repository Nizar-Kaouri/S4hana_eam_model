// ModuPorter EAM migration | Release 1.0.0
// Purpose: Active system and user statuses of all objects (JEST, INACT = space) with the object type and status kind decoded.
// Example: Read the user statuses of equipment: filter StatusObjectType = 'IE' and StatusKind = 'E'.
@AbapCatalog.sqlViewName: 'ZEMX_JESTA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Active object status'
@ObjectModel.representativeKey: 'StatusCode'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_I_ObjectStatusEntry
  as select from jest
  association [0..1] to ZEMX_I_StatusObjectInfo as _StatusObject on $projection.ObjectNumber = _StatusObject.ObjectNumber
{
      @EndUserText.label: 'Object Number'
  key jest.objnr                     as ObjectNumber,
      @EndUserText.label: 'Status Code'
  key jest.stat                      as StatusCode,
      // Compatibility note: object number prefixes IE (equipment), IF (functional location), QM (notification), OR (order), OV (operation), maintenance plan prefix to check
      @EndUserText.label: 'Status Object Type'
      substring( jest.objnr, 1, 2 )  as StatusObjectType,
      @EndUserText.label: 'Status Object Key'
      substring( jest.objnr, 3, 30 ) as StatusObjectKey,
      @EndUserText.label: 'Status Kind'
      substring( jest.stat, 1, 1 )   as StatusKind,
      @EndUserText.label: 'Status Change Number'
      jest.chgnr                     as StatusChangeNumber,
      _StatusObject
}
where jest.inact = ''
