// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ContractAssignMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V026C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ContractAssignMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_ContractAssignMig
  as select from ZMMX_I_ContractAssign as src
{
  key src.PurchasingContract as PurchasingContract,
  key src.PurchasingContractItem as PurchasingContractItem,
  key src.AccountAssignmentNumber as AccountAssignmentNumber,
      src.CostCenter as CostCenter,
      src.InternalOrder as InternalOrder,
      src.WBSElementInternalID as WBSElementInternalID,
      src.GLAccount as GLAccount,
      src.DistributionPercentage as DistributionPercentage
}
