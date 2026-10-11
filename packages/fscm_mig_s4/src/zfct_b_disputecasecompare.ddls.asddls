// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Documented amounts retain their stored currency. Invoice/item relations and customer DDIC verification remain pending.
// Purpose: Read DisputeCaseCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DisputeCaseCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_B_DisputeCaseCompare
  as select from udmcaseattr00 as src
{
  key src.case_guid as CaseUUID,
      src.fin_bukrs as CompanyCode,
      src.fin_kunnr as Customer,
      src.fin_coordinator as Coordinator,
      @Semantics.currencyCode: true
      src.fin_dispute_curr as DisputeCurrency,
      src.fin_due_date as DueDate,
      src.fin_log_system as LogicalSystem,
      @Semantics.amount.currencyCode: 'DisputeCurrency'
      src.fin_original_amt as OriginalAmount,
      @Semantics.amount.currencyCode: 'DisputeCurrency'
      src.fin_disputed_amt as DisputedAmount,
      @Semantics.amount.currencyCode: 'DisputeCurrency'
      src.fin_paid_amt as PaidAmount,
      @Semantics.amount.currencyCode: 'DisputeCurrency'
      src.fin_credited_amt as CreditedAmount,
      @Semantics.amount.currencyCode: 'DisputeCurrency'
      src.fin_wrt_off_amt as WrittenOffAmount
}
