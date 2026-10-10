# Migration interface: object_partner

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`
- **Business key:** `PartnerObjectKey`, `PartnerFunction`, `PartnerCounter` · numbering **derived**
- **Key rule:** Customers and vendors are business partners on S/4HANA; the load program resolves them.

> TODO-VERIFY[M] XPA-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_ObjectPartnerMig`

- Source: `ZEMX_I_ObjectPartner`
- Keys: `PartnerObjectKey`, `PartnerFunction`, `PartnerCounter`, `PartnerObjectType`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `PartnerObjectKey` | IHPA: substring( ihpa.objnr, 3, 30 ) | - | copy |  |
| `PartnerFunction` | IHPA-PARVW | IHPA-PARVW | copy |  |
| `PartnerCounter` | IHPA-COUNTER | IHPA-COUNTER | copy |  |
| `PartnerObjectType` | IHPA: substring( ihpa.objnr, 1, 2 ) | - | derived: object type of the object number |  |
| `Partner` | IHPA-PARNR | IHPA-PARNR | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_ObjectPartner` | `ObjectNumber` | IHPA-OBJNR | not migrated: rebuilt on S/4HANA from the object key |
| `ZEMX_I_ObjectPartner` | `IsMarkedForDeletion` | IHPA-KZLOESCH | scope flag |

## Reconciliation

- Counts: `ZEMX_C_ObjectPartnerMigCount` (ECC) vs `-` (S/4HANA) per `PartnerObjectType`, `PartnerFunction`

```bash
python3 tools/mig_reconcile.py counts --module object_partner --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

None known.
