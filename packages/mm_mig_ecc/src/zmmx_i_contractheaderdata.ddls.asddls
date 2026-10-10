// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ContractHeaderData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-024: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V024'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractHeaderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_ContractHeaderData
  as select from ekko as src
{
  key src.ebeln as PurchasingContract,
      src.bstyp as PurchasingDocumentCategory,
      src.bsart as ContractType,
      src.bukrs as CompanyCode,
      src.lifnr as Supplier,
      src.ekorg as PurchasingOrganization,
      src.ekgrp as PurchasingGroup,
      src.waers as Currency,
      src.kdatb as ValidityStartDate,
      src.kdate as ValidityEndDate
}
