// ModuPorter EAM migration | Release 1.0.0
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
define view ZEMX_B_ObjectPartner
  as select from ihpa
{
      @EndUserText.label: 'Object Number'
  key ihpa.objnr                     as ObjectNumber,
      @EndUserText.label: 'Partner Function'
  key ihpa.parvw                     as PartnerFunction,
      // Compatibility note: IHPA field names COUNTER, PARNR, KZLOESCH
      @EndUserText.label: 'Partner Counter'
  key ihpa.counter                   as PartnerCounter,
      @EndUserText.label: 'Partner Object Type'
      substring( ihpa.objnr, 1, 2 )  as PartnerObjectType,
      @EndUserText.label: 'Partner Object Key'
      substring( ihpa.objnr, 3, 30 ) as PartnerObjectKey,
      // Compatibility note: the meaning of PARNR depends on the partner function (customer, vendor, contact person, user, personnel number); customers and vendors become business partners on S/4HANA
      @EndUserText.label: 'Partner'
      ihpa.parnr                     as Partner,
      @EndUserText.label: 'Is Marked For Deletion'
      ihpa.kzloesch                  as IsMarkedForDeletion
}
