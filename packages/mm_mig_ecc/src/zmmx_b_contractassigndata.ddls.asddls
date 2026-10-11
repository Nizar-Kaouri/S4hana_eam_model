// ModuPorter MM migration | Release 1.0.0
// Purpose: Read ContractAssignData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V026'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractAssignData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_ContractAssignData
  as select from ekkn as src
{
  key src.ebeln as PurchasingContract,
  key src.ebelp as PurchasingContractItem,
  key src.zekkn as AccountAssignmentNumber,
      src.kostl as CostCenter,
      src.aufnr as InternalOrder,
      src.ps_psp_pnr as WBSElementInternalID,
      src.sakto as GLAccount,
      src.vproz as DistributionPercentage
}
