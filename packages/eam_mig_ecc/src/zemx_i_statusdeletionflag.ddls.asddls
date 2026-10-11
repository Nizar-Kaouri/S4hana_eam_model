// ModuPorter EAM migration | Release 1.0.0
// Purpose: Object numbers whose system status I0076 - deletion flag (DLFL) - is active; joined by the composite views to derive the scope flags.
// Example: Check whether order object number OR000004000001 carries I0076.
// Compatibility note: system status codes I0076 (DLFL), I0072 (NOCO), I0045 (TECO), I0046 (CLSD) and table JEST (OBJNR, STAT, INACT)
@AbapCatalog.sqlViewName: 'ZEMX_SDLFL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Objects with status deletion flag (DLFL)'
@ObjectModel.representativeKey: 'ObjectNumber'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_StatusDeletionFlag
  as select from jest
{
      @EndUserText.label: 'Object Number'
  key jest.objnr as ObjectNumber,
      @EndUserText.label: 'Status Code'
      jest.stat  as StatusCode
}
where jest.stat = 'I0076' and jest.inact = ''
