// ModuPorter MM migration | Release 1.0.0
// Purpose: Read MaterialPlantData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialPlantData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_MaterialPlantData
  as select from marc as src
{
  key src.matnr as Product,
  key src.werks as Plant,
      src.dismm as MRPType,
      src.dispo as MRPController,
      src.beskz as ProcurementType,
      src.ekgrp as PurchasingGroup,
      src.lvorm as DeletionFlag
}
