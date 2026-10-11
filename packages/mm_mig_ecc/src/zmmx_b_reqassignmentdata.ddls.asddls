// ModuPorter MM migration | Release 1.0.0
// Purpose: Read ReqAssignmentData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ReqAssignmentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_ReqAssignmentData
  as select from ebkn as src
{
  key src.banfn as PurchaseRequisition,
  key src.bnfpo as PurchaseRequisitionItem,
  key src.zebkn as AccountAssignmentNumber,
      src.kostl as CostCenter,
      src.aufnr as OrderID,
      src.sakto as GLAccount,
      src.ps_psp_pnr as WBSElementInternalID
}
