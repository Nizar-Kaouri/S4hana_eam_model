# Migration interface: customer

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `Customer` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFIX_C_CustomerMig`

- Source: `ZFIX_I_Customer`
- Keys: `Customer`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNA1-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `CustomerName` | KNA1-NAME1 | customer interface field: CustomerName (unconfirmed) | copy | yes |
| `Country` | KNA1-LAND1 | customer interface field: Country (unconfirmed) | copy | yes |
| `Region` | KNA1-REGIO | customer interface field: Region (unconfirmed) | copy | yes |
| `AccountGroup` | KNA1-KTOKD | customer interface field: AccountGroup (unconfirmed) | copy | yes |
| `DeletionFlag` | KNA1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `AddressNumber` | KNA1-ADRNR | - | information only |  |
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
| `TaxNumber1` | KNA1-STCD1 | - | copy |  |
| `TaxNumber2` | KNA1-STCD2 | - | copy |  |
| `TaxNumber3` | KNA1-STCD3 | - | copy |  |
| `TaxNumber4` | KNA1-STCD4 | - | copy |  |
| `VATRegistration` | KNA1-STCEG | - | copy |  |
| `CorrespondenceLanguage` | KNA1-SPRAS | - | copy |  |

## `ZFIX_C_CustomerCompanMig`

- Source: `ZFIX_I_CustomerCompan`
- Keys: `Customer`, `CompanyCode`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNB1-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `CompanyCode` | KNB1-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ReconciliationAccount` | KNB1-AKONT | customer interface field: ReconciliationAccount (unconfirmed) | copy | yes |
| `PaymentTerms` | KNB1-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `PaymentMethods` | KNB1-ZWELS | customer interface field: PaymentMethods (unconfirmed) | copy | yes |
| `DeletionFlag` | KNB1-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |
| `PaymentBlock` | KNB1-ZAHLS | - | copy |  |
| `SortKey` | KNB1-ZUAWA | - | copy |  |
| `PlanningGroup` | KNB1-FDGRV | - | copy |  |

## `ZFIX_C_CustomerSalesMig`

- Source: `ZFIX_I_CustomerSales`
- Keys: `Customer`, `SalesOrganization`, `DistributionChannel`, `Division`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNVV-KUNNR | customer interface field: Customer (unconfirmed) | copy | yes |
| `SalesOrganization` | KNVV-VKORG | customer interface field: SalesOrganization (unconfirmed) | copy | yes |
| `DistributionChannel` | KNVV-VTWEG | customer interface field: DistributionChannel (unconfirmed) | copy | yes |
| `Division` | KNVV-SPART | customer interface field: Division (unconfirmed) | copy | yes |
| `Currency` | KNVV-WAERS | customer interface field: Currency (unconfirmed) | copy | yes |
| `PaymentTerms` | KNVV-ZTERM | customer interface field: PaymentTerms (unconfirmed) | copy | yes |
| `DeletionFlag` | KNVV-LOEVM | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZFIX_C_CustomerAddressMig`

- Source: `ZFIX_I_CustomerAddress`
- Keys: `Customer`, `AddressValidFrom`, `AddressVersion`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNA1-KUNNR | - | copy |  |
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

## `ZFIX_C_CustomerBankMig`

- Source: `ZFIX_I_CustomerBank`
- Keys: `Customer`, `BankCountry`, `Bank`, `BankAccount`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNBK-KUNNR | - | copy |  |
| `BankCountry` | KNBK-BANKS | - | copy |  |
| `Bank` | KNBK-BANKL | - | copy |  |
| `BankAccount` | KNBK-BANKN | - | copy |  |
| `BankControlKey` | KNBK-BKONT | - | copy |  |
| `PartnerBankType` | KNBK-BVTYP | - | copy |  |
| `AccountHolder` | KNBK-KOINH | - | copy |  |

## `ZFIX_C_CustomerWHTMig`

- Source: `ZFIX_I_CustomerWHT`
- Keys: `Customer`, `CompanyCode`, `WithholdingTaxType`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNBW-KUNNR | - | copy |  |
| `CompanyCode` | KNBW-BUKRS | - | copy |  |
| `WithholdingTaxType` | KNBW-WITHT | - | copy |  |
| `WithholdingTaxCode` | KNBW-WT_WITHCD | - | copy |  |
| `WithholdingTaxID` | KNBW-WT_WTSTCD | - | copy |  |
| `ExemptionNumber` | KNBW-WT_EXNR | - | copy |  |
| `ExemptionRate` | KNBW-WT_EXRT | - | copy |  |
| `ExemptionValidFrom` | KNBW-WT_EXDF | - | copy |  |
| `ExemptionValidTo` | KNBW-WT_EXDT | - | copy |  |

## `ZFIX_C_CustomerDunningMig`

- Source: `ZFIX_I_CustomerDunning`
- Keys: `Customer`, `CompanyCode`, `DunningArea`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNB5-KUNNR | - | copy |  |
| `CompanyCode` | KNB5-BUKRS | - | copy |  |
| `DunningArea` | KNB5-MABER | - | copy |  |
| `DunningProcedure` | KNB5-MAHNA | - | copy |  |
| `DunningBlock` | KNB5-MANSP | - | copy |  |
| `DunningLevel` | KNB5-MAHNS | - | copy |  |
| `LastDunnedOn` | KNB5-MADAT | - | copy |  |
| `DunningMemo` | KNB5-KVERM | - | copy |  |

## `ZFIX_C_CustomerPartnerMig`

- Source: `ZFIX_I_CustomerPartner`
- Keys: `Customer`, `SalesOrganization`, `DistributionChannel`, `Division`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNVP-KUNNR | - | copy |  |
| `SalesOrganization` | KNVP-VKORG | - | copy |  |
| `DistributionChannel` | KNVP-VTWEG | - | copy |  |
| `Division` | KNVP-SPART | - | copy |  |
| `PartnerFunction` | KNVP-PARVW | - | copy |  |
| `PartnerCounter` | KNVP-PARZA | - | copy |  |
| `PartnerCustomer` | KNVP-KUNN2 | - | copy |  |
| `PartnerSupplier` | KNVP-LIFNR | - | copy |  |
| `PartnerContact` | KNVP-PARNR | - | copy |  |
| `PartnerPersonnel` | KNVP-PERNR | - | copy |  |
| `DefaultPartner` | KNVP-DEFPA | - | copy |  |

## `ZFIX_C_CustomerTaxMig`

- Source: `ZFIX_I_CustomerTax`
- Keys: `Customer`, `DepartureCountry`, `TaxCategory`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNVI-KUNNR | - | copy |  |
| `DepartureCountry` | KNVI-ALAND | - | copy |  |
| `TaxCategory` | KNVI-TATYP | - | copy |  |
| `TaxClassification` | KNVI-TAXKD | - | copy |  |

## `ZFIX_C_CustomerContactMig`

- Source: `ZFIX_I_CustomerContact`
- Keys: `ContactPerson`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ContactPerson` | KNVK-PARNR | - | copy |  |
| `Customer` | KNVK-KUNNR | - | copy |  |
| `FirstName` | KNVK-NAMEV | - | copy |  |
| `LastName` | KNVK-NAME1 | - | copy |  |
| `Department` | KNVK-ABTNR | - | copy |  |
| `Function` | KNVK-PAFKT | - | copy |  |
| `Telephone` | KNVK-TELF1 | - | copy |  |
| `PersonNumber` | KNVK-PRSNR | - | copy |  |

## `ZFIX_C_CustomerEmailMig`

- Source: `ZFIX_I_CustomerEmail`
- Keys: `Customer`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNA1-KUNNR | - | copy |  |
| `AddressNumber` | ADR6-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR6-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR6-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR6-CONSNUMBER | - | copy |  |
| `EmailAddress` | ADR6-SMTP_ADDR | - | copy |  |
| `IsDefaultCommunication` | ADR6-FLGDEFAULT | - | copy |  |

## `ZFIX_C_CustomerPhoneMig`

- Source: `ZFIX_I_CustomerPhone`
- Keys: `Customer`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNA1-KUNNR | - | copy |  |
| `AddressNumber` | ADR2-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR2-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR2-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR2-CONSNUMBER | - | copy |  |
| `Telephone` | ADR2-TEL_NUMBER | - | copy |  |
| `TelephoneExtension` | ADR2-TEL_EXTENS | - | copy |  |
| `IsDefaultCommunication` | ADR2-FLGDEFAULT | - | copy |  |

## `ZFIX_C_CustomerFaxMig`

- Source: `ZFIX_I_CustomerFax`
- Keys: `Customer`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | KNA1-KUNNR | - | copy |  |
| `AddressNumber` | ADR3-ADDRNUMBER | - | information only |  |
| `PersonNumber` | ADR3-PERSNUMBER | - | copy |  |
| `CommunicationValidFrom` | ADR3-DATE_FROM | - | copy |  |
| `CommunicationCounter` | ADR3-CONSNUMBER | - | copy |  |
| `FaxNumber` | ADR3-FAX_NUMBER | - | copy |  |
| `FaxExtension` | ADR3-FAX_EXTENS | - | copy |  |
| `IsDefaultCommunication` | ADR3-FLGDEFAULT | - | copy |  |

## `ZFIX_C_ContactEmailMig`

- Source: `ZFIX_I_ContactEmail`
- Keys: `ContactPerson`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ContactPerson` | KNVK-PARNR | - | copy |  |
| `AddressNumber` | source: AddressNumber | - | information only |  |
| `PersonNumber` | KNVK-PRSNR | - | copy |  |
| `CommunicationValidFrom` | source: CommunicationValidFrom | - | copy |  |
| `CommunicationCounter` | source: CommunicationCounter | - | copy |  |
| `Customer` | KNVK-KUNNR | - | copy |  |
| `EmailAddress` | source: EmailAddress | - | copy |  |
| `IsDefaultCommunication` | source: IsDefaultCommunication | - | copy |  |

## `ZFIX_C_ContactPhoneMig`

- Source: `ZFIX_I_ContactPhone`
- Keys: `ContactPerson`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ContactPerson` | KNVK-PARNR | - | copy |  |
| `AddressNumber` | source: AddressNumber | - | information only |  |
| `PersonNumber` | KNVK-PRSNR | - | copy |  |
| `CommunicationValidFrom` | source: CommunicationValidFrom | - | copy |  |
| `CommunicationCounter` | source: CommunicationCounter | - | copy |  |
| `Customer` | KNVK-KUNNR | - | copy |  |
| `Telephone` | KNVK-TELF1 | - | copy |  |
| `TelephoneExtension` | source: TelephoneExtension | - | copy |  |
| `IsDefaultCommunication` | source: IsDefaultCommunication | - | copy |  |

## `ZFIX_C_ContactFaxMig`

- Source: `ZFIX_I_ContactFax`
- Keys: `ContactPerson`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ContactPerson` | KNVK-PARNR | - | copy |  |
| `AddressNumber` | source: AddressNumber | - | information only |  |
| `PersonNumber` | KNVK-PRSNR | - | copy |  |
| `CommunicationValidFrom` | source: CommunicationValidFrom | - | copy |  |
| `CommunicationCounter` | source: CommunicationCounter | - | copy |  |
| `Customer` | KNVK-KUNNR | - | copy |  |
| `FaxNumber` | source: FaxNumber | - | copy |  |
| `FaxExtension` | source: FaxExtension | - | copy |  |
| `IsDefaultCommunication` | source: IsDefaultCommunication | - | copy |  |

## `ZFIX_C_CustomerLongTextMig`

- Source: `ZFIX_I_CustomerLongText`
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

## `ZFIX_C_CustomerIBANMig`

- Source: `ZFIX_I_CustomerIBAN`
- Keys: `Customer`, `BankCountry`, `Bank`, `BankAccount`, `BankControlKey`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Optional IBAN child joined through the full bank/control-key identity. A missing IBAN leaves the bank master/detail exports intact. Load only the selected customer/supplier bank population through a supported interface; preserve leading zeros in account and bank identifiers.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Customer` | source: Customer | - | copy |  |
| `BankCountry` | TIBAN-BANKS | - | copy |  |
| `Bank` | TIBAN-BANKL | - | copy |  |
| `BankAccount` | TIBAN-BANKN | - | copy |  |
| `BankControlKey` | TIBAN-BKONT | - | copy |  |
| `IBAN` | TIBAN-IBAN | - | copy |  |

## Reconciliation

- Counts: `ZFIX_C_CustomerMigCount` (ECC) vs `ZFIT_I_CustomerCount` (S/4HANA) per `Customer`
- Records and fields: `ZFIX_C_CustomerMig` vs `ZFIT_B_CustomerCompare` on `Customer`; compared: `CustomerName`, `Country`, `Region`

```bash
python3 tools/mig_reconcile.py counts --product fi_mig_ecc --module customer --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fi_mig_ecc --module customer --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.
