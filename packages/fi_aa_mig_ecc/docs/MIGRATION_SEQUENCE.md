# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`fixed_asset`](mapping/fixed_asset.md) | `ZFAX_C_AssetMig`, `ZFAX_C_AssetAssignmenMig`, `ZFAX_C_DepreciationMig` |
| 2 | [`asset_balance`](mapping/asset_balance.md), [`asset_transaction`](mapping/asset_transaction.md) | `ZFAX_C_AssetBalanceMig`, `ZFAX_C_AssetPostingMig` |
