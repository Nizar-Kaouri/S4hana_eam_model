# Migration interface: allocation_cycle

> Version **1.0.0**

- **Read by:** Customer-verified business interface; configuration-reference restrictions apply
- **Load after:** `cost_center`, `cost_element`
- **Business key:** `AllocationTable`, `AllocationCycle`, `ValidityStartDate` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_AllocCycleMig`

- Source: `ZCOX_I_AllocCycle`
- Keys: `AllocationTable`, `AllocationCycle`, `ValidityStartDate`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope. Cycle headers and segments alone are insufficient. Export sender/receiver rules, set membership, tracing factors, accounts, plan/actual context, iterations and company restrictions through the verified native cycle configuration export. T811* table categories and keys vary; use the full-row helper where CDS is unavailable. Do not insert T811* or recreate cycles by posting journal entries; validate and execute a test cycle in the target.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `AllocationTable` | T811C-TAB | customer interface field: AllocationTable (unconfirmed) | information only |
| `AllocationCycle` | T811C-CYCLE | customer interface field: AllocationCycle (unconfirmed) | information only |
| `ValidityStartDate` | T811C-SDATE | customer interface field: ValidityStartDate (unconfirmed) | information only |
| `ValidityEndDate` | T811C-EDATE | customer interface field: ValidityEndDate (unconfirmed) | information only |

## `ZCOX_C_AllocSegmentMig`

- Source: `ZCOX_I_AllocSegment`
- Keys: `AllocationTable`, `AllocationCycle`, `ValidityStartDate`, `SegmentSequence`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope. Cycle headers and segments alone are insufficient. Export sender/receiver rules, set membership, tracing factors, accounts, plan/actual context, iterations and company restrictions through the verified native cycle configuration export. T811* table categories and keys vary; use the full-row helper where CDS is unavailable. Do not insert T811* or recreate cycles by posting journal entries; validate and execute a test cycle in the target.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `AllocationTable` | T811S-TAB | customer interface field: AllocationTable (unconfirmed) | information only |
| `AllocationCycle` | T811S-CYCLE | customer interface field: AllocationCycle (unconfirmed) | information only |
| `ValidityStartDate` | T811S-SDATE | customer interface field: ValidityStartDate (unconfirmed) | information only |
| `SegmentSequence` | T811S-SEQNR | customer interface field: SegmentSequence (unconfirmed) | information only |
| `SegmentName` | T811S-SEGMENT | customer interface field: SegmentName (unconfirmed) | information only |

## Source controls

- Source count view: `ZCOX_C_AllocCycleMigCount`

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
- Cycle headers and segments alone are insufficient. Export sender/receiver rules, set membership, tracing factors, accounts, plan/actual context, iterations and company restrictions through the verified native cycle configuration export. T811* table categories and keys vary; use the full-row helper where CDS is unavailable. Do not insert T811* or recreate cycles by posting journal entries; validate and execute a test cycle in the target.
