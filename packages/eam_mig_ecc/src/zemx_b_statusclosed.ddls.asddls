// ModuPorter EAM migration | Release 1.0.0
// Purpose: Object numbers whose system status I0046 - closed (CLSD) - is active; joined by the composite views to derive the scope flags.
// Example: Check whether order object number OR000004000001 carries I0046.
@AbapCatalog.sqlViewName: 'ZEMX_SCLSD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Objects with status closed (CLSD)'
@ObjectModel.representativeKey: 'ObjectNumber'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_StatusClosed
  as select from jest
{
      @EndUserText.label: 'Object Number'
  key jest.objnr as ObjectNumber,
      @EndUserText.label: 'Status Code'
      jest.stat  as StatusCode
}
where jest.stat = 'I0046' and jest.inact = ''
