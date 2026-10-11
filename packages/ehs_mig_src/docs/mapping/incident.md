# Migration interface: incident

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `IncidentUUID` · numbering **keep**
- **Key rule:** Map regenerated target UUIDs before comparing; current client is implicit.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_IncidentMig`

- Source: `ZEHX_I_Incident`
- Keys: `IncidentUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `IncidentUUID` | EHHSSD_INC_ROOT-DB_KEY | Native target evidence: ZEHT_B_IncidentCompare.IncidentUUID | information only | yes |
| `IncidentID` | EHHSSD_INC_ROOT-ID | Native target evidence: ZEHT_B_IncidentCompare.IncidentID | information only | yes |
| `IncidentCategory` | EHHSSD_INC_ROOT-CATEGORY | Native target evidence: ZEHT_B_IncidentCompare.IncidentCategory | information only | yes |
| `IncidentStatus` | EHHSSD_INC_ROOT-STATUS | Native target evidence: ZEHT_B_IncidentCompare.IncidentStatus | information only | yes |
| `ReportingRequired` | EHHSSD_INC_ROOT-REPORT_REQ_TS | Native target evidence: ZEHT_B_IncidentCompare.ReportingRequired | information only | yes |
| `Fatality` | EHHSSD_INC_ROOT-FATALITY_TS | Native target evidence: ZEHT_B_IncidentCompare.Fatality | information only | yes |

## `ZEHX_C_IncidentActionMig`

- Source: `ZEHX_I_IncidentAction`
- Keys: `ActionUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ActionUUID` | EHHSSD_IAC_ROOT-DB_KEY | Native target evidence: ZEHT_B_IncidentActionCompare.ActionUUID | information only | yes |
| `ActionID` | EHHSSD_IAC_ROOT-ID | Native target evidence: ZEHT_B_IncidentActionCompare.ActionID | information only | yes |
| `ActionCategory` | EHHSSD_IAC_ROOT-CATEGORY | Native target evidence: ZEHT_B_IncidentActionCompare.ActionCategory | information only | yes |
| `ActionStatus` | EHHSSD_IAC_ROOT-STATUS | Native target evidence: ZEHT_B_IncidentActionCompare.ActionStatus | information only | yes |
| `ActionType` | EHHSSD_IAC_ROOT-TYPE | Native target evidence: ZEHT_B_IncidentActionCompare.ActionType | information only | yes |
| `Priority` | EHHSSD_IAC_ROOT-PRIORITY | Native target evidence: ZEHT_B_IncidentActionCompare.Priority | information only | yes |
| `ProtectionGoal` | EHHSSD_IAC_ROOT-PROT_GOAL | Native target evidence: ZEHT_B_IncidentActionCompare.ProtectionGoal | information only | yes |
| `Effectiveness` | EHHSSD_IAC_ROOT-EFFECTIV | Native target evidence: ZEHT_B_IncidentActionCompare.Effectiveness | information only | yes |
| `DueTimestamp` | EHHSSD_IAC_ROOT-DUE_TIMESTAMP | Native target evidence: ZEHT_B_IncidentActionCompare.DueTimestamp | information only | yes |
| `DueTimeZone` | EHHSSD_IAC_ROOT-DUE_TI_ZO | Native target evidence: ZEHT_B_IncidentActionCompare.DueTimeZone | information only | yes |
| `ResponsiblePerson` | EHHSSD_IAC_ROOT-RESP_ID | Native target evidence: ZEHT_B_IncidentActionCompare.ResponsiblePerson | information only | yes |
| `Implementer` | EHHSSD_IAC_ROOT-IMPLEM_ID | Native target evidence: ZEHT_B_IncidentActionCompare.Implementer | information only | yes |
| `Approver` | EHHSSD_IAC_ROOT-APPR_ID | Native target evidence: ZEHT_B_IncidentActionCompare.Approver | information only | yes |
| `ImplementedAt` | EHHSSD_IAC_ROOT-IMPL_TIMESTAMP | Native target evidence: ZEHT_B_IncidentActionCompare.ImplementedAt | information only | yes |
| `ImplementationTimeZone` | EHHSSD_IAC_ROOT-IMPL_TI_ZO | Native target evidence: ZEHT_B_IncidentActionCompare.ImplementationTimeZone | information only | yes |
| `ApprovedAt` | EHHSSD_IAC_ROOT-APPR_TIMESTAMP | Native target evidence: ZEHT_B_IncidentActionCompare.ApprovedAt | information only | yes |
| `ApprovalTimeZone` | EHHSSD_IAC_ROOT-APPR_TI_ZO | Native target evidence: ZEHT_B_IncidentActionCompare.ApprovalTimeZone | information only | yes |

## Reconciliation

- Counts: `ZEHX_C_IncidentMigCount` (SAP source) vs `ZEHT_I_IncidentCount` (S/4HANA) as global candidate counts
- Records and fields: `ZEHX_C_IncidentMig` vs `ZEHT_B_IncidentCompare` on `IncidentUUID`; compared: `IncidentID`, `IncidentCategory`, `IncidentStatus`, `ReportingRequired`, `Fatality`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module incident --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module incident --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- Incident: Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.
- IncidentPerson: Person identity/name fields are resolved from HCM/business partners/users; roles come from a separate node. Native reference keys, role cardinality and person resolution remain pending.
- IncidentAction: Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.
