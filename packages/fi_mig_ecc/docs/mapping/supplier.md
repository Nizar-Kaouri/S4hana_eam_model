# Migration interface: supplier

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `Supplier` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_SupplierMig`

- Source: `ZFIX_I_Supplier`
- Keys: `Supplier`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFA1-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `SupplierName` | LFA1-NAME1 | customer interface field: SupplierName (unconfirmed) | copy | yes |
| `Country` | LFA1-LAND1 | customer interface field: Country (unconfirmed) | copy | yes |
| `Region` | LFA1-REGIO | customer interface field: Region (unconfirmed) | copy | yes |
| `AccountGroup` | LFA1-KTOKK | customer interface field: AccountGroup (unconfirmed) | copy | yes |
| `DeletionFlag` | LFA1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `AddressNumber` | LFA1-ADRNR | - | information only |  |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |  |
| `AddressName1` | ADRC-NAME1 | - | copy |  |
| `AddressName2` | ADRC-NAME2 | - | copy |  |
| `AddressName3` | ADRC-NAME3 | - | copy |  |
| `AddressName4` | ADRC-NAME4 | - | copy |  |
| `AddressStreet` | ADRC-STREET | - | copy |  |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |  |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |  |
| `AddressCity` | ADRC-CITY1 | - | copy |  |
| `AddressDistrict` | ADRC-CITY2 | - | copy |  |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |  |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |  |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |  |
| `AddressCountry` | ADRC-COUNTRY | - | copy |  |
| `AddressRegion` | ADRC-REGION | - | copy |  |
| `AddressLanguage` | ADRC-LANGU | - | copy |  |
| `HasStandardAddress` | derived: presence of the standard ADRC record | - | information only |  |

## `ZFIX_C_SupplierCompanMig`

- Source: `ZFIX_I_SupplierCompan`
- Keys: `Supplier`, `CompanyCode`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFB1-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `CompanyCode` | LFB1-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ReconciliationAccount` | LFB1-AKONT | customer interface field: ReconciliationAccount (unconfirmed) | copy | yes |
| `PaymentTerms` | LFB1-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `PaymentMethods` | LFB1-ZWELS | customer interface field: PaymentMethods (unconfirmed) | copy | yes |
| `DeletionFlag` | LFB1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZFIX_C_SupplierPurchaMig`

- Source: `ZFIX_I_SupplierPurcha`
- Keys: `Supplier`, `PurchasingOrganization`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFM1-LIFNR | customer interface field: Supplier (unconfirmed) | copy | yes |
| `PurchasingOrganization` | LFM1-EKORG | customer interface field: PurchasingOrganization (unconfirmed) | copy | yes |
| `OrderCurrency` | LFM1-WAERS | customer interface field: OrderCurrency (unconfirmed) | copy | yes |
| `PaymentTerms` | LFM1-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `DeletionFlag` | LFM1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZFIX_C_SupplierAddressMig`

- Source: `ZFIX_I_SupplierAddress`
- Keys: `Supplier`, `AddressValidFrom`, `AddressVersion`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFA1-LIFNR | - | copy |  |
| `AddressNumber` | ADRC-ADDRNUMBER | - | information only |  |
| `AddressValidFrom` | ADRC-DATE_FROM | - | copy |  |
| `AddressVersion` | ADRC-NATION | - | copy |  |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |  |
| `AddressName1` | ADRC-NAME1 | - | copy |  |
| `AddressName2` | ADRC-NAME2 | - | copy |  |
| `AddressName3` | ADRC-NAME3 | - | copy |  |
| `AddressName4` | ADRC-NAME4 | - | copy |  |
| `AddressStreet` | ADRC-STREET | - | copy |  |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |  |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |  |
| `AddressCity` | ADRC-CITY1 | - | copy |  |
| `AddressDistrict` | ADRC-CITY2 | - | copy |  |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |  |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |  |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |  |
| `AddressCountry` | ADRC-COUNTRY | - | copy |  |
| `AddressRegion` | ADRC-REGION | - | copy |  |
| `AddressLanguage` | ADRC-LANGU | - | copy |  |

## Reconciliation

- Counts: `ZFIX_C_SupplierMigCount` (ECC) vs `ZFIT_I_SupplierCount` (S/4HANA) per `Supplier`
- Records and fields: `ZFIX_C_SupplierMig` vs `ZFIT_B_SupplierCompare` on `Supplier`; compared: `SupplierName`, `Country`, `Region`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module supplier --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fi_mig_ecc --module supplier --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
