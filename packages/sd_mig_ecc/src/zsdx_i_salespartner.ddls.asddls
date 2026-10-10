// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesPartner as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_SalesPartner
  as select from ZSDX_I_SalesPartnerData as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
  key src.PartnerFunction as PartnerFunction,
      src.Customer as Customer,
      src.Supplier as Supplier,
      src.PersonnelNumber as PersonnelNumber
}
