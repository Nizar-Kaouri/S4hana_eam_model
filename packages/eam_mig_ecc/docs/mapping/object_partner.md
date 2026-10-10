# Mapping: object_partner

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Partner (part of the object migration)*
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`
- **Business key:** `ObjectNumber`, `PartnerFunction`, `PartnerCounter` · numbering **derived**
- **Key rule:** Partner numbers of customers and vendors map to business partners (key map 'business_partner' from the customer / vendor integration).
- **Scope filter:** `IsMarkedForDeletion = ''`

> TODO-VERIFY[H] XPA-M01: Migration Cockpit object for 'Partner (part of the object migration)' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_ObjectPartner` | `ObjectNumber` | IHPA-OBJNR | IHPA-OBJNR | derive: object key from the object number |  |
| `ZEMX_I_ObjectPartner` | `PartnerFunction` | IHPA-PARVW | IHPA-PARVW | value map: `partner_function` |  |
| `ZEMX_I_ObjectPartner` | `PartnerCounter` | IHPA-COUNTER | IHPA-COUNTER | copy |  |
| `ZEMX_I_ObjectPartner` | `PartnerObjectType` | substring( ihpa.objnr, 1, 2 ) | - | derive: selection helper - object type of the object number |  |
| `ZEMX_I_ObjectPartner` | `Partner` | IHPA-PARNR | IHPA-PARNR | convert: `partner_to_business_partner` |  |
| `ZEMX_I_ObjectPartner` | `IsMarkedForDeletion` | IHPA-KZLOESCH | - | scope filter |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `partner_function`

## Reconciliation

- Counts: `ZEMX_R_ObjectPartnerCount` (ECC) vs `-` (S/4HANA) per `PartnerObjectType`, `PartnerFunction`

```bash
python3 tools/mig_reconcile.py counts --module object_partner --source ecc_counts.csv --target s4_counts.csv --maps <folder>
```

## Open gaps

None known.
