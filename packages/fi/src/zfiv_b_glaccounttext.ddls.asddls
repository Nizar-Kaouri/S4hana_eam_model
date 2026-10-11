// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Language-dependent G/L account short and long text; text provider for ZFIV_B_GLAccount.
// Example: Account names in balance and line item reports.
// TODO-VERIFY[M] FI-T01: I_GLAccountText exists with keys ChartOfAccounts, GLAccount, Language and elements GLAccountName, GLAccountLongName
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'G/L Account - Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'GLAccount'
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZFIV_B_GLAccountText
  as select from I_GLAccountText
{
  key ChartOfAccounts,
  key GLAccount,
      @Semantics.language: true
  key Language,
      @Semantics.text: true
      GLAccountName,
      @Semantics.text: true
      GLAccountLongName
}
