// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Object numbers whose system status I0045 - technically completed (TECO) - is active; joined by the composite views to derive the scope flags.
// Example: Check whether order object number OR000004000001 carries I0045.
@AbapCatalog.sqlViewName: 'ZEMX_STECO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Objects with status technically completed (TECO)'
@ObjectModel.representativeKey: 'ObjectNumber'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_StatusTechCompleted
  as select from jest
{
  key jest.objnr as ObjectNumber,
      jest.stat  as StatusCode
}
where jest.stat = 'I0045' and jest.inact = ''
