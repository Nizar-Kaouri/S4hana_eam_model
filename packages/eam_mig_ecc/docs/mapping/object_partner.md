# Migration interface: object_partner

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`
- **Business key:** `PartnerObjectKey`, `PartnerFunction`, `PartnerCounter` · numbering **derived**
- **Key rule:** Customers and vendors map to business partners through the key map 'BUSINESS_PARTNER' from the business partner migration.

> TODO-VERIFY[M] XPA-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_ObjectPartnerMig`

- Source: `ZEMX_I_ObjectPartner`
- Keys: `LegacyPartnerObjectKey`, `LegacyPartnerFunction`, `PartnerCounter`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PartnerCounter` | IHPA-COUNTER | IHPA-COUNTER | copy |  |
| `PartnerFunction` | IHPA-PARVW | IHPA-PARVW | value map: `PARTNER_FUNCTION` |  |
| `PartnerObjectType` | IHPA: substring( ihpa.objnr, 1, 2 ) | - | derived: object type of the object number |  |
| `PartnerObjectKey` | IHPA: substring( ihpa.objnr, 3, 30 ) | - | key map: `EQUIPMENT`, `FUNCTIONAL_LOCATION`, `MAINTENANCE_NOTIFICATION`, `MAINTENANCE_ORDER` |  |
| `Partner` | IHPA-PARNR | IHPA-PARNR | key map: `BUSINESS_PARTNER` |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_ObjectPartner` | `ObjectNumber` | IHPA-OBJNR | not migrated: rebuilt on S/4HANA from the translated object key |
| `ZEMX_I_ObjectPartner` | `IsMarkedForDeletion` | IHPA-KZLOESCH | scope flag |

## Maps

- value map `PARTNER_FUNCTION`
- key map `BUSINESS_PARTNER` (from another migration)
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `MAINTENANCE_NOTIFICATION`
- key map `MAINTENANCE_ORDER`

## Reconciliation

- Counts: `ZEMX_C_ObjectPartnerMigCount` (ECC, translated values) vs `-` (S/4HANA) per `PartnerObjectType`, `PartnerFunction`

```bash
python3 tools/mig_reconcile.py counts --module object_partner --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

None known.
