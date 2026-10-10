# Migration interface: freight_settlement

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `freight_order`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `SettlementID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightSettleMig`

- Source: `ZTMX_I_FreightSettle`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `SettlementID`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS018-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS018-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS018-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `SettlementID` | ZTMX_TMS018-F004 | Customer native interface: SettlementID (adapter required) | information only | yes |
| `FreightOrderID` | ZTMX_TMS018-F005 | Customer native interface: FreightOrderID (adapter required) | information only | yes |
| `Carrier` | ZTMX_TMS018-F006 | Customer native interface: Carrier (adapter required) | information only | yes |
| `CompanyCode` | ZTMX_TMS018-F007 | Customer native interface: CompanyCode (adapter required) | information only | yes |
| `Currency` | ZTMX_TMS018-F008 | Customer native interface: Currency (adapter required) | information only | yes |
| `TotalAmount` | ZTMX_TMS018-F009 | Customer native interface: TotalAmount (adapter required) | information only | yes |
| `SettlementStatus` | ZTMX_TMS018-F010 | Customer native interface: SettlementStatus (adapter required) | information only | yes |
| `AccountingDocument` | ZTMX_TMS018-F011 | Customer native interface: AccountingDocument (adapter required) | information only | yes |

## `ZTMX_C_SettleItemMig`

- Source: `ZTMX_I_SettleItem`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `SettlementID`, `SettlementItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS019-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS019-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS019-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `SettlementID` | ZTMX_TMS019-F004 | Customer native interface: SettlementID (adapter required) | information only | yes |
| `SettlementItem` | ZTMX_TMS019-F005 | Customer native interface: SettlementItem (adapter required) | information only | yes |
| `ChargeType` | ZTMX_TMS019-F006 | Customer native interface: ChargeType (adapter required) | information only | yes |
| `Amount` | ZTMX_TMS019-F007 | Customer native interface: Amount (adapter required) | information only | yes |
| `Currency` | ZTMX_TMS019-F008 | Customer native interface: Currency (adapter required) | information only | yes |
| `TaxCode` | ZTMX_TMS019-F009 | Customer native interface: TaxCode (adapter required) | information only | yes |
| `ReferenceItem` | ZTMX_TMS019-F010 | Customer native interface: ReferenceItem (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZTMX_C_FreightSettleMigCount` (ECC) vs `ZTMT_I_FreightSettleCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_FreightSettleMig` vs `ZTMT_I_FreightSettleCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `SettlementID`; compared: `FreightOrderID`, `Carrier`, `CompanyCode`, `Currency`, `TotalAmount`, `SettlementStatus`, `AccountingDocument`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module freight_settlement --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module freight_settlement --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
