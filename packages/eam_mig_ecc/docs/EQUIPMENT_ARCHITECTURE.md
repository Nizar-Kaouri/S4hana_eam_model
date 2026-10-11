# Equipment migration architecture

The main consumption export contains one current master record per Equipment on a consistent source snapshot. Location/account assignment, ABC, manufacturer and standard postal address are scalar master fields. Repeating children remain separate and preserve their complete keys.

```text
EQUI -> B_EquipmentHeader -----------+
EQUZ -> B_EquipmentTimeSegment -----+-> I_Equipment -> C_EquipmentMig
ILOA -> B_LocAcctAssignment --------+       |
ADRC -> B_Address (standard key) ---+       +-> I_EquipText -> C_EquipmentTextMig
                                           +-> I_EquipPartner -> C_EquipPartnerMig
                                           +-> I_EquipStatus -> C_EquipStatusMig (reference)
                                           |                -> C_EquipUserStatusMig
                                           +-> I_EquipLongText -> C_EquipLongTextMig
ADRC -> B_Address (all versions) -----------+-> I_EquipAddress -> C_EquipAddressMig
```

All custom names have the ZEMX_ prefix. Selecting equipment with build_package.py includes core, work center, object partner, object status and long text dependencies. Generic cross-object exports remain available; use the equipment-specific exports for this object, rather than loading the same records from both sets.

## Postal address

Current EQUZ.ILOAN -> ILOA.ADRNR -> ADRC.ADDRNUMBER. The master uses a to-one CDS association (left join when its fields are selected) with DATE_FROM = 00010101 and NATION blank, matching the complete standard ADRC key (client handled by CDS). It preserves equipment without an address. AddressNumber is the source reference; HasStandardAddress distinguishes a found standard record from a missing/nonstandard record. Names 1-4, street, house number/supplement, city, district, postal code, PO box/postal code, country, region and language are delivered.

C_EquipAddressMig preserves all ADRC DATE_FROM/NATION versions separately. Missing standard records require review using this export or the full-row ADRC helper; no arbitrary version is silently substituted. No claim is made that all these extraction fields exist in the chosen target migration template: map them against the actual target template or supported posting interface. SAP creates target address numbers; do not copy source ADRNR as a target business identity. Partner master addresses and multiple communication records belong to the corresponding partner migration, not this equipment postal-address join.

## Scope, grain and posting

Equipment texts, partners, statuses and long-text keys inner-join an existing current non-deleted equipment master. Partners/statuses join by the real OBJNR. Long-text keys compare the complete canonical internal equipment number with EQUI text names; custom text-name formats require an explicit customer mapping. The generic long-text index and READ_TEXT helper remain available for those formats.

The customer-cohort contract additionally semi-joins every child against the exact selected C_EquipmentMig population. Apply the same contract if filtering the master by plant or project outside CDS. Generic object exports retain their explicit cohort contracts.

Active system statuses are reference data, recreated by SAP business processing. Only C_EquipUserStatusMig supplies user statuses for a separate supported post-load operation. C_EquipLongTextMig is an index, not text content: use READ_TEXT and preserve line order and SAPscript formatting.

The master no longer advertises EQUI-AEDAT as a complete delta: independent address/location/text/partner/status changes are not covered by that date. Use consistent full cutover snapshots and a source change freeze or a separately designed change-capture strategy. Confirm EQUZ current-segment uniqueness before loading; repeated rows must stop preparation, never be hidden by DISTINCT.

## SAP sources and design interpretation

- [PM - Equipment migration object](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/08c1d29f1acc4d459ecc198dc18ee6ce.html): master with partner and short/long-text child structures.
- [SAP technical-location field origins](https://help.sap.com/docs/BI_CONTENT_757/f31040d0f1c14fd8ac4752828c3bc668/10e9ff9614584db4b01dd9181373e6ba.html): ILOA.ADRNR address link.
- [SAP MDG EAM configuration](https://help.sap.com/doc/d49a4577882444c5ac1ea87f3f6d7c25/MDG%20EAM%202023%20on%202023%20S_4HANA/en-US/UGI_EAM_2023_ConfigurationGuide_S4H.pdf): equipment address ownership through ILOA.ADRNR.
- [SAP address import format](https://help.sap.com/docs/SAP_MASTER_DATA_GOVERNANCE/db97296fe85d45f9b846e8cd2a580fbd/82d9dd5336a140c5b967bfcaf1ff90cc.html): ADRC keys and standard DATE_FROM/NATION values.

The B/I/C implementation, standard-address master join and equipment-specific cohort exports are engineering choices informed by these sources; they are not an SAP certification. Source DDIC and target interface compatibility still depend on the installed SAP release.
