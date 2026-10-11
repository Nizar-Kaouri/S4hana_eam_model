// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesPartnerMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesPartnerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesPartnerMig
  as select from ZSDX_I_SalesPartner as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
  key src.PartnerFunction as PartnerFunction,
      src.Customer as Customer,
      src.Supplier as Supplier,
      src.PersonnelNumber as PersonnelNumber
}
