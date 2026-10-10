// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SecondaryPlanData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V011'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SecondaryPlanData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_SecondaryPlanData
  as select from coss as src
{
  key src.lednr as Ledger,
  key src.objnr as ObjectNumber,
  key src.gjahr as FiscalYear,
  key src.wrttp as ValueType,
  key src.versn as PlanVersion,
  key src.kstar as CostElement,
  key src.hrkft as OriginGroup,
  key src.vrgng as BusinessTransaction,
  key src.vbund as TradingPartner,
  key src.pargb as PartnerBusinessArea,
  key src.beknz as DebitCreditCode,
  key src.perbl as PeriodBlock,
      src.twaer as TransactionCurrency,
      src.wkg001 as ControllingAmount01,
      src.wog001 as ObjectAmount01,
      src.wtg001 as TransactionAmount01,
      src.wkg002 as ControllingAmount02,
      src.wog002 as ObjectAmount02,
      src.wtg002 as TransactionAmount02,
      src.wkg003 as ControllingAmount03,
      src.wog003 as ObjectAmount03,
      src.wtg003 as TransactionAmount03,
      src.wkg004 as ControllingAmount04,
      src.wog004 as ObjectAmount04,
      src.wtg004 as TransactionAmount04,
      src.wkg005 as ControllingAmount05,
      src.wog005 as ObjectAmount05,
      src.wtg005 as TransactionAmount05,
      src.wkg006 as ControllingAmount06,
      src.wog006 as ObjectAmount06,
      src.wtg006 as TransactionAmount06,
      src.wkg007 as ControllingAmount07,
      src.wog007 as ObjectAmount07,
      src.wtg007 as TransactionAmount07,
      src.wkg008 as ControllingAmount08,
      src.wog008 as ObjectAmount08,
      src.wtg008 as TransactionAmount08,
      src.wkg009 as ControllingAmount09,
      src.wog009 as ObjectAmount09,
      src.wtg009 as TransactionAmount09,
      src.wkg010 as ControllingAmount10,
      src.wog010 as ObjectAmount10,
      src.wtg010 as TransactionAmount10,
      src.wkg011 as ControllingAmount11,
      src.wog011 as ObjectAmount11,
      src.wtg011 as TransactionAmount11,
      src.wkg012 as ControllingAmount12,
      src.wog012 as ObjectAmount12,
      src.wtg012 as TransactionAmount12,
      src.wkg013 as ControllingAmount13,
      src.wog013 as ObjectAmount13,
      src.wtg013 as TransactionAmount13,
      src.wkg014 as ControllingAmount14,
      src.wog014 as ObjectAmount14,
      src.wtg014 as TransactionAmount14,
      src.wkg015 as ControllingAmount15,
      src.wog015 as ObjectAmount15,
      src.wtg015 as TransactionAmount15,
      src.wkg016 as ControllingAmount16,
      src.wog016 as ObjectAmount16,
      src.wtg016 as TransactionAmount16
}
