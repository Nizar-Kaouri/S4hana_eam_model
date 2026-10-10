// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Active system and user statuses of all objects (equipment IE, functional location IF, notification QM, order OR, ...) with the status profile for user statuses.
// Example: Extract the user statuses of equipment: filter StatusObjectType = 'IE' and StatusKind = 'E'.
@AbapCatalog.sqlViewName: 'ZEMX_ST'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Object status (migration extract)'
@ObjectModel.representativeKey: 'StatusCode'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_I_ObjectStatus
  as select from jest
    left outer join jsto on jsto.objnr = jest.objnr
{
  key jest.objnr                    as ObjectNumber,
  key jest.stat                     as StatusCode,
      // TODO-VERIFY[H] XST-002: object number prefixes IE (equipment), IF (functional location), QM (notification), OR (order), OV (operation), WO? (maintenance plan) - check the plan prefix
      substring( jest.objnr, 1, 2 ) as StatusObjectType,
      substring( jest.stat, 1, 1 )  as StatusKind,
      // TODO-VERIFY[M] XST-001: JSTO-STSMA is the status profile of the object
      jsto.stsma                    as StatusProfile,
      jest.chgnr                    as StatusChangeNumber
}
where jest.inact = ''
