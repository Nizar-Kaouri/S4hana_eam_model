# Migration sequence

> Version **1.0.0**

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`bank`](mapping/bank.md), [`customer`](mapping/customer.md), [`gl_account`](mapping/gl_account.md), [`supplier`](mapping/supplier.md) | `ZFIX_C_BankMig`, `ZFIX_C_CustomerMig`, `ZFIX_C_CustomerCompanMig`, `ZFIX_C_CustomerSalesMig`, `ZFIX_C_GLAccountMig`, `ZFIX_C_GLAccountTextMig`, `ZFIX_C_GLCompanyMig`, `ZFIX_C_SupplierMig`, `ZFIX_C_SupplierCompanMig`, `ZFIX_C_SupplierPurchaMig` |
| 2 | [`gl_line_item`](mapping/gl_line_item.md), [`gl_opening_balance`](mapping/gl_opening_balance.md), [`open_items`](mapping/open_items.md) | `ZFIX_C_AccountingHeadMig`, `ZFIX_C_AccountingItemMig`, `ZFIX_C_ClassicBalanceMig`, `ZFIX_C_NewGLBalanceMig`, `ZFIX_C_GLOpenMig`, `ZFIX_C_GLClearedMig`, `ZFIX_C_APOpenMig`, `ZFIX_C_APClearedMig`, `ZFIX_C_AROpenMig`, `ZFIX_C_ARClearedMig` |
