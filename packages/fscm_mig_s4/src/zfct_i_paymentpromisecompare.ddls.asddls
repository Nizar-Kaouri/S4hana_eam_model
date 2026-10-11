// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Documented amounts retain their stored currency. Invoice/item relations and customer DDIC verification remain pending.
// Purpose: Read PaymentPromiseCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PaymentPromiseCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_PaymentPromiseCompare
  as select from udm_p2p_attr as src
{
  key src.case_guid as CaseUUID,
      src.fin_comp_code as CompanyCode,
      src.fin_customer as Customer,
      @Semantics.currencyCode: true
      src.fin_p2p_curr as Currency,
      src.fin_p2p_due_date as DueDate,
      src.fin_p2p_date as PromiseDate,
      src.fin_p2p_state as PromiseState,
      src.fin_p2p_level as PromiseLevel,
      src.fin_promised_by as PromisedBy,
      @Semantics.amount.currencyCode: 'Currency'
      src.fin_promised_amt as PromisedAmount,
      @Semantics.amount.currencyCode: 'Currency'
      src.fin_paid_amount as PaidAmount
}
