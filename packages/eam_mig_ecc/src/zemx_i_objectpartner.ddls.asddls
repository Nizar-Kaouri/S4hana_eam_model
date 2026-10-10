// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Partners of technical objects, notifications and orders (IHPA) with the object type and key decoded.
// Example: Read the partners of equipment: filter PartnerObjectType = 'IE'.
@AbapCatalog.sqlViewName: 'ZEMX_IHPA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Object partner'
@ObjectModel.representativeKey: 'PartnerCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_ObjectPartner
  as select from ihpa
{
  key ihpa.objnr                     as ObjectNumber,
  key ihpa.parvw                     as PartnerFunction,
      // TODO-VERIFY[M] XPA-001: IHPA field names COUNTER, PARNR, KZLOESCH
  key ihpa.counter                   as PartnerCounter,
      substring( ihpa.objnr, 1, 2 )  as PartnerObjectType,
      substring( ihpa.objnr, 3, 30 ) as PartnerObjectKey,
      // TODO-VERIFY[H] XPA-002: the meaning of PARNR depends on the partner function (customer, vendor, contact person, user, personnel number); customers and vendors become business partners on S/4HANA
      ihpa.parnr                     as Partner,
      ihpa.kzloesch                  as IsMarkedForDeletion
}
