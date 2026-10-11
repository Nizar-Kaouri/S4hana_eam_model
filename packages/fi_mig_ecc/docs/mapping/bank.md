# Migration interface: bank

> Version **1.0.0**

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
| `AddressNumber` | BNKA-ADRNR | - | information only |  |
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

## `ZFIX_C_BankAddressMig`

- Source: `ZFIX_I_BankAddress`
- Keys: `BankCountry`, `BankKey`, `AddressValidFrom`, `AddressVersion`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads. Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BankCountry` | BNKA-BANKS | - | copy |  |
| `BankKey` | BNKA-BANKL | - | copy |  |
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

## `ZFIX_C_BankEmailMig`

- Source: `ZFIX_I_BankEmail`
- Keys: `BankCountry`, `BankKey`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface. Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BankCountry` | BNKA-BANKS | - | copy |  |
| `BankKey` | BNKA-BANKL | - | copy |  |
| `AddressNumber` | ADR6-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR6-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR6-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR6-CONSNUMBER | - | copy |  |
| `EmailAddress` | ADR6-SMTP_ADDR | - | copy |  |
| `IsDefaultCommunication` | ADR6-FLGDEFAULT | - | copy |  |

## `ZFIX_C_BankPhoneMig`

- Source: `ZFIX_I_BankPhone`
- Keys: `BankCountry`, `BankKey`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface. Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BankCountry` | BNKA-BANKS | - | copy |  |
| `BankKey` | BNKA-BANKL | - | copy |  |
| `AddressNumber` | ADR2-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR2-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR2-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR2-CONSNUMBER | - | copy |  |
| `Telephone` | ADR2-TEL_NUMBER | - | copy |  |
| `TelephoneExtension` | ADR2-TEL_EXTENS | - | copy |  |
| `IsDefaultCommunication` | ADR2-FLGDEFAULT | - | copy |  |

## `ZFIX_C_BankFaxMig`

- Source: `ZFIX_I_BankFax`
- Keys: `BankCountry`, `BankKey`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface. Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BankCountry` | BNKA-BANKS | - | copy |  |
| `BankKey` | BNKA-BANKL | - | copy |  |
| `AddressNumber` | ADR3-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR3-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR3-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR3-CONSNUMBER | - | copy |  |
| `FaxNumber` | ADR3-FAX_NUMBER | - | copy |  |
| `FaxExtension` | ADR3-FAX_EXTENS | - | copy |  |
| `IsDefaultCommunication` | ADR3-FLGDEFAULT | - | copy |  |

## Reconciliation

- Counts: `ZFIX_C_BankMigCount` (ECC) vs `-` (S/4HANA) per `BankCountry`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module bank --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
- Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.
