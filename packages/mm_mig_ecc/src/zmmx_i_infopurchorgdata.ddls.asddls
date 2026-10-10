// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InfoPurchOrgData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-023: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V023'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoPurchOrgData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_InfoPurchOrgData
  as select from eine as src
{
  key src.infnr as PurchasingInfoRecord,
  key src.ekorg as PurchasingOrganization,
  key src.esokz as InfoRecordCategory,
  key src.werks as Plant,
      src.ekgrp as PurchasingGroup,
      src.waers as Currency,
      src.netpr as NetPrice,
      src.peinh as PriceUnit,
      src.bprme as PriceUnitOfMeasure,
      src.loekz as DeletionFlag
}
