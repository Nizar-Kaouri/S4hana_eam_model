# Migration interface: bank

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** Customer-verified business interface; master restrictions apply
- **Load after:** - (first level)
- **Business key:** `BankCountry`, `BankKey` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_BankMig`

- Source: `ZFIX_I_Bank`
- Keys: `BankCountry`, `BankKey`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances. Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BankCountry` | BNKA-BANKS | customer interface field: BankCountry (unconfirmed) | copy | yes |
| `BankKey` | BNKA-BANKL | customer interface field: BankKey (unconfirmed) | copy | yes |
| `BankName` | BNKA-BANKA | customer interface field: BankName (unconfirmed) | copy | yes |
| `City` | BNKA-ORT01 | customer interface field: City (unconfirmed) | copy | yes |
| `Street` | BNKA-STRAS | customer interface field: Street (unconfirmed) | copy | yes |
| `SWIFTCode` | BNKA-SWIFT | customer interface field: SWIFTCode (unconfirmed) | copy | yes |
| `DeletionFlag` | BNKA-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZFIX_C_BankMigCount` (ECC) vs `-` (S/4HANA) per `BankCountry`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module bank --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
- Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.
