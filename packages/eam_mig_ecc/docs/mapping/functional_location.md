# Migration interface: functional_location

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`
- **Business key:** `FunctionalLocation` · numbering **keep**
- **Key rule:** Functional location labels are external keys. Load superior locations before their children.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_FuncLocMig`

- Source: `ZEMX_I_FuncLoc`
- Keys: `FunctionalLocation`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | IFLOT-TPLNR | copy |
| `FunctionalLocationCategory` | IFLOT-FLTYP | IFLOT-FLTYP | copy |
| `FuncLocationStructure` | IFLOT-TPLKZ | IFLOT-TPLKZ | copy |
| `SuperiorFunctionalLocation` | IFLOT-TPLMA | IFLOT-TPLMA | copy |
| `TechnicalObjectType` | IFLOT-EQART | IFLOT-EQART | copy |
| `AuthorizationGroup` | IFLOT-BEGRU | IFLOT-BEGRU | copy |
| `MaintenancePlanningPlant` | IFLOT-IWERK | IFLOT-IWERK | copy |
| `MaintenancePlannerGroup` | IFLOT-INGRP | IFLOT-INGRP | copy |
| `EquipInstallationIsAllowed` | IFLOT-IEQUI | IFLOT-IEQUI | copy |
| `EquipIsSingleInstallation` | IFLOT-EINZL | IFLOT-EINZL | copy |
| `ConstructionType` | IFLOT-SUBMT | IFLOT-SUBMT | copy |
| `AssetManufacturerName` | IFLOT-HERST | IFLOT-HERST | copy |
| `ConstructionYear` | IFLOT-BAUJJ | IFLOT-BAUJJ | copy |
| `InventoryNumber` | IFLOT-INVNR | IFLOT-INVNR | copy |
| `OperationStartDate` | IFLOT-INBDT | IFLOT-INBDT | copy |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | copy |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | copy |
| `AssetLocation` | ILOA-STORT | ILOA-STORT | copy |
| `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |
| `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy |
| `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |
| `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | copy |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | copy |
| `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | copy |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | copy |
| `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | copy |
| `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | copy |
| `StandingOrder` | ILOA-DAUFN | - | derived: follow-up step after the order load |
| `LastChangeDate` | IFLOT-AEDAT | - | information only |
| `AddressNumber` | ILOA-ADRNR | - | information only |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |
| `AddressName1` | ADRC-NAME1 | - | copy |
| `AddressName2` | ADRC-NAME2 | - | copy |
| `AddressName3` | ADRC-NAME3 | - | copy |
| `AddressName4` | ADRC-NAME4 | - | copy |
| `AddressStreet` | ADRC-STREET | - | copy |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |
| `AddressCity` | ADRC-CITY1 | - | copy |
| `AddressDistrict` | ADRC-CITY2 | - | copy |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |
| `AddressCountry` | ADRC-COUNTRY | - | copy |
| `AddressRegion` | ADRC-REGION | - | copy |
| `AddressLanguage` | ADRC-LANGU | - | copy |
| `HasStandardAddress` | derived: presence of the standard ADRC record | - | information only |

## `ZEMX_C_FuncLocTextMig`

- Source: `ZEMX_I_FuncLocText`
- Keys: `FunctionalLocation`, `Language`
- Scope: `_FuncLoc.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOTX-TPLNR | IFLOTX-TPLNR | copy |
| `Language` | IFLOTX-SPRAS | IFLOTX-SPRAS | copy |
| `FunctionalLocationName` | IFLOTX-PLTXT | IFLOTX-PLTXT | copy |

## `ZEMX_C_FuncLocLabelMig`

- Source: `ZEMX_I_FuncLocLabel`
- Keys: `FunctionalLocation`, `LabelingSystem`
- Scope: `_Parent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOS-TPLNR | IFLOS-TPLNR | copy |
| `LabelingSystem` | IFLOS-ALTNR | IFLOS-ALTNR | copy |
| `AlternativeLabel` | IFLOS-STRNO | IFLOS-STRNO | copy |
| `IsActiveLabel` | IFLOS-ACTVS | IFLOS-ACTVS | copy |

## `ZEMX_C_FuncLocAddressMig`

- Source: `ZEMX_I_FuncLocAddress`
- Keys: `FunctionalLocation`, `AddressValidFrom`, `AddressVersion`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | - | copy |
| `AddressNumber` | ADRC-ADDRNUMBER | - | information only |
| `AddressValidFrom` | ADRC-DATE_FROM | - | copy |
| `AddressVersion` | ADRC-NATION | - | copy |
| `AddressValidTo` | ADRC-DATE_TO | - | copy |
| `AddressName1` | ADRC-NAME1 | - | copy |
| `AddressName2` | ADRC-NAME2 | - | copy |
| `AddressName3` | ADRC-NAME3 | - | copy |
| `AddressName4` | ADRC-NAME4 | - | copy |
| `AddressStreet` | ADRC-STREET | - | copy |
| `AddressHouseNumber` | ADRC-HOUSE_NUM1 | - | copy |
| `AddressHouseNumberSupplement` | ADRC-HOUSE_NUM2 | - | copy |
| `AddressCity` | ADRC-CITY1 | - | copy |
| `AddressDistrict` | ADRC-CITY2 | - | copy |
| `AddressPostalCode` | ADRC-POST_CODE1 | - | copy |
| `AddressPOBox` | ADRC-PO_BOX | - | copy |
| `AddressPOBoxPostalCode` | ADRC-POST_CODE2 | - | copy |
| `AddressCountry` | ADRC-COUNTRY | - | copy |
| `AddressRegion` | ADRC-REGION | - | copy |
| `AddressLanguage` | ADRC-LANGU | - | copy |

## `ZEMX_C_FuncLocPartnerMig`

- Source: `ZEMX_I_FuncLocPartner`
- Keys: `FunctionalLocation`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | - | copy |
| `PartnerFunction` | IHPA-PARVW | - | copy |
| `PartnerCounter` | IHPA-COUNTER | - | copy |
| `Partner` | IHPA-PARNR | - | copy |

## `ZEMX_C_FuncLocStatusMig`

- Source: `ZEMX_I_FuncLocStatus`
- Keys: `FunctionalLocation`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | source: FunctionalLocation | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | source: StatusKind | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |

## `ZEMX_C_FuncLocUserStatusMig`

- Source: `ZEMX_I_FuncLocUserStatus`
- Keys: `FunctionalLocation`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | source: FunctionalLocation | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | source: StatusKind | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |

## `ZEMX_C_FuncLocClassMig`

- Source: `ZEMX_I_FuncLocClass`
- Keys: `FunctionalLocation`, `ClassType`, `Class`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve ECM counters and evaluate classification effectivity at the approved cutover date before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | source: FunctionalLocation | - | copy |
| `ClassType` | KSSK-KLART | - | copy |
| `Class` | KLAH-CLASS | - | copy |
| `ClassificationStatus` | KSSK-STATU | - | copy |

## `ZEMX_C_FuncLocCharcMig`

- Source: `ZEMX_I_FuncLocCharc`
- Keys: `FunctionalLocation`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve ECM counters and evaluate classification effectivity at the approved cutover date before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | source: FunctionalLocation | - | copy |
| `ClassType` | AUSP-KLART | - | copy |
| `Characteristic` | CABN-ATNAM | - | copy |
| `CharcValuePositionNumber` | AUSP-ATZHL | - | copy |
| `CharcValue` | AUSP-ATWRT | - | copy |
| `CharcFromNumericValue` | AUSP-ATFLV | - | copy |
| `CharcToNumericValue` | AUSP-ATFLB | - | copy |
| `CharcValueDependency` | AUSP-ATCOD | - | copy |

## `ZEMX_C_FuncLocEmailMig`

- Source: `ZEMX_I_FuncLocEmail`
- Keys: `FunctionalLocation`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | - | copy |
| `AddressNumber` | ADR6-ADDRNUMBER | - | information only |
| `PersonNumber` | ADR6-PERSNUMBER | - | copy |
| `CommunicationValidFrom` | ADR6-DATE_FROM | - | copy |
| `CommunicationCounter` | ADR6-CONSNUMBER | - | copy |
| `EmailAddress` | ADR6-SMTP_ADDR | - | copy |
| `IsDefaultCommunication` | ADR6-FLGDEFAULT | - | copy |

## `ZEMX_C_FuncLocPhoneMig`

- Source: `ZEMX_I_FuncLocPhone`
- Keys: `FunctionalLocation`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | - | copy |
| `AddressNumber` | ADR2-ADDRNUMBER | - | information only |
| `PersonNumber` | ADR2-PERSNUMBER | - | copy |
| `CommunicationValidFrom` | ADR2-DATE_FROM | - | copy |
| `CommunicationCounter` | ADR2-CONSNUMBER | - | copy |
| `Telephone` | ADR2-TEL_NUMBER | - | copy |
| `TelephoneExtension` | ADR2-TEL_EXTENS | - | copy |
| `IsDefaultCommunication` | ADR2-FLGDEFAULT | - | copy |

## `ZEMX_C_FuncLocFaxMig`

- Source: `ZEMX_I_FuncLocFax`
- Keys: `FunctionalLocation`, `AddressNumber`, `PersonNumber`, `CommunicationValidFrom`, `CommunicationCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve every communication counter and date. Organization communication only (PERSNUMBER blank); personal contact data belongs to the contact-person business object. Map SAP-generated target address identities through a supported interface.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | - | copy |
| `AddressNumber` | ADR3-ADDRNUMBER | - | information only |
| `PersonNumber` | ADR3-PERSNUMBER | - | copy |
| `CommunicationValidFrom` | ADR3-DATE_FROM | - | copy |
| `CommunicationCounter` | ADR3-CONSNUMBER | - | copy |
| `FaxNumber` | ADR3-FAX_NUMBER | - | copy |
| `FaxExtension` | ADR3-FAX_EXTENS | - | copy |
| `IsDefaultCommunication` | ADR3-FLGDEFAULT | - | copy |

## `ZEMX_C_FuncLocLongTextMig`

- Source: `ZEMX_I_FuncLocLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## `ZEMX_C_FuncLocBOMMig`

- Source: `ZEMX_I_FuncLocBOM`
- Keys: `FunctionalLocation`, `Plant`, `BOMUsage`, `BillOfMaterial`, `BOMAlternative`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Select the functional-location BOM assignments with the same prepared functional locations. Derive the approved BOM category T / number / alternative and node populations for the existing equipment_bom header, selection and item exports. Apply their documented ECM/key-date workflow; source BOM numbers are mapped to target identities.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `FunctionalLocation` | TPST-TPLNR | - | copy |
| `Plant` | TPST-WERKS | - | copy |
| `BOMUsage` | TPST-STLAN | - | copy |
| `BillOfMaterial` | TPST-STLNR | - | copy |
| `BOMAlternative` | TPST-STLAL | - | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_FuncLoc` | `ObjectNumber` | IFLOT-OBJNR | not migrated: status object number - regenerated on S/4HANA; joins status and partners |
| `ZEMX_I_FuncLoc` | `IsMarkedForDeletion` | derived: case fl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_FuncLoc` | `CreationDate` | IFLOT-ERDAT | information only |
| `ZEMX_I_FuncLoc` | `CreatedByUser` | IFLOT-ERNAM | information only |

## Source controls

- Source count view: `ZEMX_C_FuncLocMigCount`

## Open gaps

- Compatibility note: IFLOS labels are delivered; verify labeling-system keys and active-state interpretation and align target structure edit masks.
