// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read OrderSettlemenData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderSettlemenData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_OrderSettlemenData
  as select from cobrb as src
{
  key src.objnr as ObjectNumber,
  key src.bureg as DistributionRuleGroup,
  key src.lfdnr as DistributionRule,
      src.perbz as SettlementType,
      src.prozs as SettlementPercentage,
      src.kostl as ReceiverCostCenter,
      src.aufnr as ReceiverOrder
}
