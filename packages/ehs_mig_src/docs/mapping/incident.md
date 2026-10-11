# Migration interface: incident

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `IncidentUUID` · numbering **keep**
- **Key rule:** Map regenerated target UUIDs during loading; current client is implicit.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_IncidentMig`

- Source: `ZEHX_I_Incident`
- Keys: `IncidentUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `IncidentUUID` | EHHSSD_INC_ROOT-DB_KEY | Native target evidence: ZEHT_B_IncidentCompare.IncidentUUID | information only |
| `IncidentID` | EHHSSD_INC_ROOT-ID | Native target evidence: ZEHT_B_IncidentCompare.IncidentID | information only |
| `IncidentCategory` | EHHSSD_INC_ROOT-CATEGORY | Native target evidence: ZEHT_B_IncidentCompare.IncidentCategory | information only |
| `IncidentStatus` | EHHSSD_INC_ROOT-STATUS | Native target evidence: ZEHT_B_IncidentCompare.IncidentStatus | information only |
| `ReportingRequired` | EHHSSD_INC_ROOT-REPORT_REQ_TS | Native target evidence: ZEHT_B_IncidentCompare.ReportingRequired | information only |
| `Fatality` | EHHSSD_INC_ROOT-FATALITY_TS | Native target evidence: ZEHT_B_IncidentCompare.Fatality | information only |

## `ZEHX_C_IncidentActionMig`

- Source: `ZEHX_I_IncidentAction`
- Keys: `ActionUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ActionUUID` | EHHSSD_IAC_ROOT-DB_KEY | Native target evidence: ZEHT_B_IncidentActionCompare.ActionUUID | information only |
| `ActionID` | EHHSSD_IAC_ROOT-ID | Native target evidence: ZEHT_B_IncidentActionCompare.ActionID | information only |
| `ActionCategory` | EHHSSD_IAC_ROOT-CATEGORY | Native target evidence: ZEHT_B_IncidentActionCompare.ActionCategory | information only |
| `ActionStatus` | EHHSSD_IAC_ROOT-STATUS | Native target evidence: ZEHT_B_IncidentActionCompare.ActionStatus | information only |
| `ActionType` | EHHSSD_IAC_ROOT-TYPE | Native target evidence: ZEHT_B_IncidentActionCompare.ActionType | information only |
| `Priority` | EHHSSD_IAC_ROOT-PRIORITY | Native target evidence: ZEHT_B_IncidentActionCompare.Priority | information only |
| `ProtectionGoal` | EHHSSD_IAC_ROOT-PROT_GOAL | Native target evidence: ZEHT_B_IncidentActionCompare.ProtectionGoal | information only |
| `Effectiveness` | EHHSSD_IAC_ROOT-EFFECTIV | Native target evidence: ZEHT_B_IncidentActionCompare.Effectiveness | information only |
| `DueTimestamp` | EHHSSD_IAC_ROOT-DUE_TIMESTAMP | Native target evidence: ZEHT_B_IncidentActionCompare.DueTimestamp | information only |
| `DueTimeZone` | EHHSSD_IAC_ROOT-DUE_TI_ZO | Native target evidence: ZEHT_B_IncidentActionCompare.DueTimeZone | information only |
| `ResponsiblePerson` | EHHSSD_IAC_ROOT-RESP_ID | Native target evidence: ZEHT_B_IncidentActionCompare.ResponsiblePerson | information only |
| `Implementer` | EHHSSD_IAC_ROOT-IMPLEM_ID | Native target evidence: ZEHT_B_IncidentActionCompare.Implementer | information only |
| `Approver` | EHHSSD_IAC_ROOT-APPR_ID | Native target evidence: ZEHT_B_IncidentActionCompare.Approver | information only |
| `ImplementedAt` | EHHSSD_IAC_ROOT-IMPL_TIMESTAMP | Native target evidence: ZEHT_B_IncidentActionCompare.ImplementedAt | information only |
| `ImplementationTimeZone` | EHHSSD_IAC_ROOT-IMPL_TI_ZO | Native target evidence: ZEHT_B_IncidentActionCompare.ImplementationTimeZone | information only |
| `ApprovedAt` | EHHSSD_IAC_ROOT-APPR_TIMESTAMP | Native target evidence: ZEHT_B_IncidentActionCompare.ApprovedAt | information only |
| `ApprovalTimeZone` | EHHSSD_IAC_ROOT-APPR_TI_ZO | Native target evidence: ZEHT_B_IncidentActionCompare.ApprovalTimeZone | information only |

## Source controls

- Source count view: `ZEHX_C_IncidentMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- Incident: Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.
- IncidentPerson: Person identity/name fields are resolved from HCM/business partners/users; roles come from a separate node. Native reference keys, role cardinality and person resolution remain pending.
- IncidentAction: Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.
