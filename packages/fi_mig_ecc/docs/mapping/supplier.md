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
| `TaxNumber1` | LFA1-STCD1 | - | copy |  |
| `TaxNumber2` | LFA1-STCD2 | - | copy |  |
| `TaxNumber3` | LFA1-STCD3 | - | copy |  |
| `TaxNumber4` | LFA1-STCD4 | - | copy |  |
| `VATRegistration` | LFA1-STCEG | - | copy |  |
| `CorrespondenceLanguage` | LFA1-SPRAS | - | copy |  |

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
| `PaymentBlock` | LFB1-ZAHLS | - | copy |  |
| `SortKey` | LFB1-ZUAWA | - | copy |  |
| `PlanningGroup` | LFB1-FDGRV | - | copy |  |

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

## `ZFIX_C_SupplierBankMig`

- Source: `ZFIX_I_SupplierBank`
- Keys: `Supplier`, `BankCountry`, `Bank`, `BankAccount`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFBK-LIFNR | - | copy |  |
| `BankCountry` | LFBK-BANKS | - | copy |  |
| `Bank` | LFBK-BANKL | - | copy |  |
| `BankAccount` | LFBK-BANKN | - | copy |  |
| `BankControlKey` | LFBK-BKONT | - | copy |  |
| `PartnerBankType` | LFBK-BVTYP | - | copy |  |
| `AccountHolder` | LFBK-KOINH | - | copy |  |

## `ZFIX_C_SupplierWHTMig`

- Source: `ZFIX_I_SupplierWHT`
- Keys: `Supplier`, `CompanyCode`, `WithholdingTaxType`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFBW-LIFNR | - | copy |  |
| `CompanyCode` | LFBW-BUKRS | - | copy |  |
| `WithholdingTaxType` | LFBW-WITHT | - | copy |  |
| `WithholdingTaxCode` | LFBW-WT_WITHCD | - | copy |  |
| `WithholdingTaxID` | LFBW-WT_WTSTCD | - | copy |  |
| `ExemptionNumber` | LFBW-WT_EXNR | - | copy |  |
| `ExemptionRate` | LFBW-WT_EXRT | - | copy |  |
| `ExemptionValidFrom` | LFBW-WT_EXDF | - | copy |  |
| `ExemptionValidTo` | LFBW-WT_EXDT | - | copy |  |

## `ZFIX_C_SupplierDunningMig`

- Source: `ZFIX_I_SupplierDunning`
- Keys: `Supplier`, `CompanyCode`, `DunningArea`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFB5-LIFNR | - | copy |  |
| `CompanyCode` | LFB5-BUKRS | - | copy |  |
| `DunningArea` | LFB5-MABER | - | copy |  |
| `DunningProcedure` | LFB5-MAHNA | - | copy |  |
| `DunningBlock` | LFB5-MANSP | - | copy |  |
| `DunningLevel` | LFB5-MAHNS | - | copy |  |
| `LastDunnedOn` | LFB5-MADAT | - | copy |  |
| `DunningMemo` | LFB5-KVERM | - | copy |  |

## `ZFIX_C_SupplierPartnerMig`

- Source: `ZFIX_I_SupplierPartner`
- Keys: `Supplier`, `PurchasingOrganization`, `SupplierSubrange`, `Plant`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | WYT3-LIFNR | - | copy |  |
| `PurchasingOrganization` | WYT3-EKORG | - | copy |  |
| `SupplierSubrange` | WYT3-LTSNR | - | copy |  |
| `Plant` | WYT3-WERKS | - | copy |  |
| `PartnerFunction` | WYT3-PARVW | - | copy |  |
| `PartnerCounter` | WYT3-PARZA | - | copy |  |
| `PartnerSupplier` | WYT3-LIFN2 | - | copy |  |
| `PartnerContact` | WYT3-PARNR | - | copy |  |
| `DefaultPartner` | WYT3-DEFPA | - | copy |  |

## `ZFIX_C_SupplierEmailMig`

- Source: `ZFIX_I_SupplierEmail`
- Keys: `Supplier`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFA1-LIFNR | - | copy |  |
| `AddressNumber` | ADR6-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR6-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR6-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR6-CONSNUMBER | - | copy |  |
| `EmailAddress` | ADR6-SMTP_ADDR | - | copy |  |
| `IsDefaultCommunication` | ADR6-FLGDEFAULT | - | copy |  |

## `ZFIX_C_SupplierPhoneMig`

- Source: `ZFIX_I_SupplierPhone`
- Keys: `Supplier`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFA1-LIFNR | - | copy |  |
| `AddressNumber` | ADR2-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR2-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR2-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR2-CONSNUMBER | - | copy |  |
| `Telephone` | ADR2-TEL_NUMBER | - | copy |  |
| `TelephoneExtension` | ADR2-TEL_EXTENS | - | copy |  |
| `IsDefaultCommunication` | ADR2-FLGDEFAULT | - | copy |  |

## `ZFIX_C_SupplierFaxMig`

- Source: `ZFIX_I_SupplierFax`
- Keys: `Supplier`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | LFA1-LIFNR | - | copy |  |
| `AddressNumber` | ADR3-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR3-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR3-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR3-CONSNUMBER | - | copy |  |
| `FaxNumber` | ADR3-FAX_NUMBER | - | copy |  |
| `FaxExtension` | ADR3-FAX_EXTENS | - | copy |  |
| `IsDefaultCommunication` | ADR3-FLGDEFAULT | - | copy |  |

## `ZFIX_C_SupplierLongTextMig`

- Source: `ZFIX_I_SupplierLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## `ZFIX_C_SupplierIBANMig`

- Source: `ZFIX_I_SupplierIBAN`
- Keys: `Supplier`, `BankCountry`, `Bank`, `BankAccount`, `BankControlKey`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Optional IBAN child joined through the full bank/control-key identity. A missing IBAN leaves the bank master/detail exports intact. Load only the selected customer/supplier bank population through a supported interface; preserve leading zeros in account and bank identifiers.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Supplier` | source: Supplier | - | copy |  |
| `BankCountry` | TIBAN-BANKS | - | copy |  |
| `Bank` | TIBAN-BANKL | - | copy |  |
| `BankAccount` | TIBAN-BANKN | - | copy |  |
| `BankControlKey` | TIBAN-BKONT | - | copy |  |
| `IBAN` | TIBAN-IBAN | - | copy |  |

## Reconciliation

- Counts: `ZFIX_C_SupplierMigCount` (ECC) vs `ZFIT_I_SupplierCount` (S/4HANA) per `Supplier`
- Records and fields: `ZFIX_C_SupplierMig` vs `ZFIT_B_SupplierCompare` on `Supplier`; compared: `SupplierName`, `Country`, `Region`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module supplier --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fi_mig_ecc --module supplier --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
