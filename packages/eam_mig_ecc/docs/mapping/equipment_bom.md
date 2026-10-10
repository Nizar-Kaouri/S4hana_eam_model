# Migration interface: equipment_bom

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program; resolve BOM effective states before posting
- **Load after:** `equipment`
- **Business key:** `Equipment`, `Plant`, `BOMUsage`, `BOMAlternative` · numbering **new**
- **Key rule:** Maintain old-to-new BOM identifiers in the customer loader.

> TODO-VERIFY[H] XBM-T01: resolve alternative and engineering-change validity at cutover; raw BOM counters must not be posted as multiple current items.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_EquipBOMAssignMig`

- Source: `ZEMX_I_EquipBOMAssign`
- Keys: `Equipment`, `Plant`, `BOMUsage`, `BOMAlternative`
- Scope: `_Parent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Equipment` | EQST-EQUNR | EQST-EQUNR | copy |  |
| `Plant` | EQST-WERKS | EQST-WERKS | copy |  |
| `BOMUsage` | EQST-STLAN | EQST-STLAN | copy |  |
| `BillOfMaterial` | EQST-STLNR | EQST-STLNR | copy |  |
| `BOMAlternative` | EQST-STLAL | EQST-STLAL | copy |  |

## `ZEMX_C_BOMHeaderMig`

- Source: `ZEMX_I_BOMHeader`
- Keys: `BOMCategory`, `BillOfMaterial`, `BOMAlternative`, `HeaderCounter`
- Scope: `all rows`
- Delivery mode: **version_ledger**
- Before posting: Restrict BillOfMaterial to selected equipment assignments. Resolve alternative, valid-from date, change-number and deletion states at cutover before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BOMCategory` | STKO-STLTY | STKO-STLTY | copy |  |
| `BillOfMaterial` | STKO-STLNR | STKO-STLNR | copy |  |
| `BOMAlternative` | STKO-STLAL | STKO-STLAL | copy |  |
| `HeaderCounter` | STKO-STKOZ | STKO-STKOZ | copy |  |
| `ValidityStartDate` | STKO-DATUV | STKO-DATUV | copy |  |
| `IsMarkedForDeletion` | STKO-LKENZ | STKO-LKENZ | copy |  |
| `BaseQuantity` | STKO-BMENG | STKO-BMENG | copy |  |
| `BaseUnit` | STKO-BMEIN | STKO-BMEIN | copy |  |

## `ZEMX_C_BOMSelectionMig`

- Source: `ZEMX_I_BOMSelection`
- Keys: `BOMCategory`, `BillOfMaterial`, `BOMAlternative`, `BOMItemNode`, `SelectionCounter`
- Scope: `all rows`
- Delivery mode: **version_ledger**
- Before posting: Restrict BillOfMaterial to selected equipment assignments. Resolve alternative, valid-from date, change-number and deletion states at cutover before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BOMCategory` | STAS-STLTY | STAS-STLTY | copy |  |
| `BillOfMaterial` | STAS-STLNR | STAS-STLNR | copy |  |
| `BOMAlternative` | STAS-STLAL | STAS-STLAL | copy |  |
| `BOMItemNode` | STAS-STLKN | STAS-STLKN | copy |  |
| `SelectionCounter` | STAS-STASZ | STAS-STASZ | copy |  |
| `ValidityStartDate` | STAS-DATUV | STAS-DATUV | copy |  |
| `IsMarkedForDeletion` | STAS-LKENZ | STAS-LKENZ | copy |  |

## `ZEMX_C_BOMItemMig`

- Source: `ZEMX_I_BOMItem`
- Keys: `BOMCategory`, `BillOfMaterial`, `BOMItemNode`, `ItemCounter`
- Scope: `all rows`
- Delivery mode: **version_ledger**
- Before posting: Restrict BillOfMaterial to selected equipment assignments. Resolve alternative, valid-from date, change-number and deletion states at cutover before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BOMCategory` | STPO-STLTY | STPO-STLTY | copy |  |
| `BillOfMaterial` | STPO-STLNR | STPO-STLNR | copy |  |
| `BOMItemNode` | STPO-STLKN | STPO-STLKN | copy |  |
| `ItemCounter` | STPO-STPOZ | STPO-STPOZ | copy |  |
| `ValidityStartDate` | STPO-DATUV | STPO-DATUV | copy |  |
| `BOMItemNumber` | STPO-POSNR | STPO-POSNR | copy |  |
| `BOMItemCategory` | STPO-POSTP | STPO-POSTP | copy |  |
| `ComponentMaterial` | STPO-IDNRK | STPO-IDNRK | copy |  |
| `ComponentQuantity` | STPO-MENGE | STPO-MENGE | copy |  |
| `ComponentUnit` | STPO-MEINS | STPO-MEINS | copy |  |
| `IsMarkedForDeletion` | STPO-LKENZ | STPO-LKENZ | copy |  |

## Reconciliation

- Counts: `ZEMX_C_EquipBOMMigCount` (ECC) vs `-` (S/4HANA) per `Plant`, `BOMUsage`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module equipment_bom --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

None known.
