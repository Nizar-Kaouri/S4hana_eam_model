// ZFIV FI VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per G/L account in a chart of accounts: account type (balance sheet, P&L, primary / secondary
//   costs), account group, balance-sheet flag and deletion flag; dimension for journal cubes.
// Example: Balances per account group; P&L accounts only.
// TODO-VERIFY[M] FI-001: I_GLAccountInChartOfAccounts elements GLAccountType, GLAccountGroup, IsBalanceSheetAccount, AccountIsMarkedForDeletion, CreationDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'G/L Account'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'GLAccount'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define view entity ZFIV_I_GLAccount
  as select from I_GLAccountInChartOfAccounts
  association [0..*] to ZFIV_I_GLAccountText as _Text on $projection.ChartOfAccounts = _Text.ChartOfAccounts
    and $projection.GLAccount = _Text.GLAccount
{
  key ChartOfAccounts,
      @ObjectModel.text.association: '_Text'
  key GLAccount,
      GLAccountType,
      GLAccountGroup,
      IsBalanceSheetAccount,
      AccountIsMarkedForDeletion,
      CreationDate,

      /* Associations */
      _Text
}
