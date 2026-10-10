// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
{
  key jest.objnr                     as ObjectNumber,
  key jest.stat                      as StatusCode,
      // TODO-VERIFY[H] XST-002: object number prefixes IE (equipment), IF (functional location), QM (notification), OR (order), OV (operation), maintenance plan prefix to check
      substring( jest.objnr, 1, 2 )  as StatusObjectType,
      substring( jest.objnr, 3, 30 ) as StatusObjectKey,
      substring( jest.stat, 1, 1 )   as StatusKind,
      jest.chgnr                     as StatusChangeNumber
}
where jest.inact = ''
