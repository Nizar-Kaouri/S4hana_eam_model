# Financial Accounting (FI) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/fi` |
| Object prefix | `ZFIV_` (replaced per customer by the build) |
| ABAP package | `ZFIV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZFIV_B_*`,
composite `ZFIV_I_*` (cubes), consumption `ZFIV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **6 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZFIV_C_GLBalanceAccountQ` | gl_account, gl_line_item |
| `ZFIV_C_PayablesAgingQ` | open_items, supplier |
| `ZFIV_C_ReceivablesAgingQ` | customer, open_items |
| `ZFIV_I_GLItemWithAccount` | gl_account, gl_line_item |
| `ZFIV_I_OpenItemWithCustomer` | customer, open_items |
| `ZFIV_I_OpenItemWithSupplier` | open_items, supplier |

## Data model in one paragraph

G/L accounts, suppliers and customers are master data modules. G/L line items come from the Universal Journal (`I_JournalEntryItem`, all ledgers) with debit / credit split and balance. Open payables and receivables come from `I_OperationalAcctgDocItem` (items without a clearing document) with overdue days and aging buckets. Open items at a past key date and planning data are not included yet.

## Modules (5 modules, 13 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `gl_account` | 1 | - | `ZFIV_B_GLAccountText`, `ZFIV_B_GLAccount`, `ZFIV_B_GLAccountVH` |
| `supplier` | 1 | - | `ZFIV_B_Supplier`, `ZFIV_B_SupplierVH` |
| `customer` | 1 | - | `ZFIV_B_Customer`, `ZFIV_B_CustomerVH` |
| `gl_line_item` | 2 | - | `ZFIV_B_GLJournalItem`, `ZFIV_I_GLJournalItem`, `ZFIV_C_GLBalanceQ` |
| `open_items` | 2 | - | `ZFIV_B_OpenItem`, `ZFIV_I_OpenItemAging`, `ZFIV_C_OpenItemAgingQ` |

## Commands

```bash
python3 tools/check_all.py --only fi
python3 build_package.py --product fi --list
python3 build_package.py --product fi --all --prefix ZACME_ --package ZACME_FI
```
