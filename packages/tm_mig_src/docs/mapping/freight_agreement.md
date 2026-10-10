# Migration interface: freight_agreement

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `AgreementID`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightAgreeMig`

- Source: `ZTMX_I_FreightAgree`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `AgreementID`, `Version`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS008-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS008-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS008-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `AgreementID` | ZTMX_TMS008-F004 | Customer native interface: AgreementID (adapter required) | copy | yes |
| `Version` | ZTMX_TMS008-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `AgreementType` | ZTMX_TMS008-F006 | Customer native interface: AgreementType (adapter required) | copy | yes |
| `Carrier` | ZTMX_TMS008-F007 | Customer native interface: Carrier (adapter required) | copy | yes |
| `Currency` | ZTMX_TMS008-F008 | Customer native interface: Currency (adapter required) | copy | yes |
| `ValidityStartDate` | ZTMX_TMS008-F009 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZTMX_TMS008-F010 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |
| `ReleaseStatus` | ZTMX_TMS008-F011 | Customer native interface: ReleaseStatus (adapter required) | copy | yes |

## `ZTMX_C_FreightRateMig`

- Source: `ZTMX_I_FreightRate`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `AgreementID`, `Version`, `RateID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS009-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS009-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS009-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `AgreementID` | ZTMX_TMS009-F004 | Customer native interface: AgreementID (adapter required) | copy | yes |
| `Version` | ZTMX_TMS009-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `RateID` | ZTMX_TMS009-F006 | Customer native interface: RateID (adapter required) | copy | yes |
| `ChargeType` | ZTMX_TMS009-F007 | Customer native interface: ChargeType (adapter required) | copy | yes |
| `CalculationBasis` | ZTMX_TMS009-F008 | Customer native interface: CalculationBasis (adapter required) | copy | yes |
| `Rate` | ZTMX_TMS009-F009 | Customer native interface: Rate (adapter required) | copy | yes |
| `Currency` | ZTMX_TMS009-F010 | Customer native interface: Currency (adapter required) | copy | yes |
| `PricingUnit` | ZTMX_TMS009-F011 | Customer native interface: PricingUnit (adapter required) | copy | yes |
| `QuantityUnit` | ZTMX_TMS009-F012 | Customer native interface: QuantityUnit (adapter required) | copy | yes |

## `ZTMX_C_FreightScaleMig`

- Source: `ZTMX_I_FreightScale`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `AgreementID`, `Version`, `RateID`, `ScaleLine`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS010-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS010-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS010-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `AgreementID` | ZTMX_TMS010-F004 | Customer native interface: AgreementID (adapter required) | copy | yes |
| `Version` | ZTMX_TMS010-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `RateID` | ZTMX_TMS010-F006 | Customer native interface: RateID (adapter required) | copy | yes |
| `ScaleLine` | ZTMX_TMS010-F007 | Customer native interface: ScaleLine (adapter required) | copy | yes |
| `FromValue` | ZTMX_TMS010-F008 | Customer native interface: FromValue (adapter required) | copy | yes |
| `ToValue` | ZTMX_TMS010-F009 | Customer native interface: ToValue (adapter required) | copy | yes |
| `ScaleUnit` | ZTMX_TMS010-F010 | Customer native interface: ScaleUnit (adapter required) | copy | yes |
| `ScaleRate` | ZTMX_TMS010-F011 | Customer native interface: ScaleRate (adapter required) | copy | yes |
| `Currency` | ZTMX_TMS010-F012 | Customer native interface: Currency (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZTMX_C_FreightAgreeMigCount` (ECC) vs `ZTMT_I_FreightAgreeCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_FreightAgreeMig` vs `ZTMT_I_FreightAgreeCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `AgreementID`, `Version`; compared: `AgreementType`, `Carrier`, `Currency`, `ValidityStartDate`, `ValidityEndDate`, `ReleaseStatus`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module freight_agreement --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module freight_agreement --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
