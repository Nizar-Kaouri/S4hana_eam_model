// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Status profile per object number (JSTO).
// Example: Read the status profile of equipment object IE000000000010000001.
@AbapCatalog.sqlViewName: 'ZEMX_JSTO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Status object information'
@ObjectModel.representativeKey: 'ObjectNumber'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #XL
@VDM.viewType: #BASIC
define view ZEMX_I_StatusObjectInfo
  as select from jsto
{
      @EndUserText.label: 'Object Number'
  key jsto.objnr as ObjectNumber,
      // TODO-VERIFY[M] XST-001: JSTO-STSMA is the status profile of the object
      @EndUserText.label: 'Status Profile'
      jsto.stsma as StatusProfile
}
