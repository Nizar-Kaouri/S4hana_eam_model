# CDS layer naming

Every ModuPorter CDS name has the product prefix followed by its layer letter.

| Letter | Layer | Equipment example |
|---|---|---|
| B | Basic — reads source tables or SAP views | ZEMX_B_EquipmentHeader |
| I | Interface — Composite business-object view | ZEMX_I_Equipment |
| C | Consumption — extraction or reporting output | ZEMX_C_EquipmentMig |

The corresponding SAP annotations stay #BASIC, #COMPOSITE and #CONSUMPTION. SAP-owned I_ views retain their names. Classic SQL view names remain stable.

This update renames existing customer CDS objects and their DCL/metadata companions. Install the updated sources and follow ACTIVATION_ORDER.txt. Existing installations must update dependent custom code using the rename catalog; importing new names does not remove old objects.
