// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PrimaryPlanMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PrimaryPlanMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_PrimaryPlanMig
  as select from ZCOX_I_PrimaryPlan as src
{
  key src.Ledger as Ledger,
  key src.ObjectNumber as ObjectNumber,
  key src.FiscalYear as FiscalYear,
  key src.ValueType as ValueType,
  key src.PlanVersion as PlanVersion,
  key src.CostElement as CostElement,
  key src.OriginGroup as OriginGroup,
  key src.BusinessTransaction as BusinessTransaction,
  key src.TradingPartner as TradingPartner,
  key src.PartnerBusinessArea as PartnerBusinessArea,
  key src.DebitCreditCode as DebitCreditCode,
  key src.PeriodBlock as PeriodBlock,
      src.TransactionCurrency as TransactionCurrency,
      src.ControllingAmount01 as ControllingAmount01,
      src.ObjectAmount01 as ObjectAmount01,
      src.TransactionAmount01 as TransactionAmount01,
      src.ControllingAmount02 as ControllingAmount02,
      src.ObjectAmount02 as ObjectAmount02,
      src.TransactionAmount02 as TransactionAmount02,
      src.ControllingAmount03 as ControllingAmount03,
      src.ObjectAmount03 as ObjectAmount03,
      src.TransactionAmount03 as TransactionAmount03,
      src.ControllingAmount04 as ControllingAmount04,
      src.ObjectAmount04 as ObjectAmount04,
      src.TransactionAmount04 as TransactionAmount04,
      src.ControllingAmount05 as ControllingAmount05,
      src.ObjectAmount05 as ObjectAmount05,
      src.TransactionAmount05 as TransactionAmount05,
      src.ControllingAmount06 as ControllingAmount06,
      src.ObjectAmount06 as ObjectAmount06,
      src.TransactionAmount06 as TransactionAmount06,
      src.ControllingAmount07 as ControllingAmount07,
      src.ObjectAmount07 as ObjectAmount07,
      src.TransactionAmount07 as TransactionAmount07,
      src.ControllingAmount08 as ControllingAmount08,
      src.ObjectAmount08 as ObjectAmount08,
      src.TransactionAmount08 as TransactionAmount08,
      src.ControllingAmount09 as ControllingAmount09,
      src.ObjectAmount09 as ObjectAmount09,
      src.TransactionAmount09 as TransactionAmount09,
      src.ControllingAmount10 as ControllingAmount10,
      src.ObjectAmount10 as ObjectAmount10,
      src.TransactionAmount10 as TransactionAmount10,
      src.ControllingAmount11 as ControllingAmount11,
      src.ObjectAmount11 as ObjectAmount11,
      src.TransactionAmount11 as TransactionAmount11,
      src.ControllingAmount12 as ControllingAmount12,
      src.ObjectAmount12 as ObjectAmount12,
      src.TransactionAmount12 as TransactionAmount12,
      src.ControllingAmount13 as ControllingAmount13,
      src.ObjectAmount13 as ObjectAmount13,
      src.TransactionAmount13 as TransactionAmount13,
      src.ControllingAmount14 as ControllingAmount14,
      src.ObjectAmount14 as ObjectAmount14,
      src.TransactionAmount14 as TransactionAmount14,
      src.ControllingAmount15 as ControllingAmount15,
      src.ObjectAmount15 as ObjectAmount15,
      src.TransactionAmount15 as TransactionAmount15,
      src.ControllingAmount16 as ControllingAmount16,
      src.ObjectAmount16 as ObjectAmount16,
      src.TransactionAmount16 as TransactionAmount16
}
