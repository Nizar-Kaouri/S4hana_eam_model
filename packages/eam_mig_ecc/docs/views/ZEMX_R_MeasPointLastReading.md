# ZEMX_R_MeasPointLastReading

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Last reading per measuring point |
| Module | `measurement_document` |
| Batch | 1 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | - |
| Data source | `ZEMX_R_MeasPointLastDoc`, join `ZEMX_I_MeasurementDocument` |
| Source file | `src/zemx_r_measpointlastreading.ddls.asddls` |

## Purpose

Latest valid reading per measuring point: the default migration scope (initial counter readings so that performance-based maintenance plans continue).

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration extraction/reconciliation view on ECC: it must return every record of the object. Access is controlled by the extraction channel (ODP/RFC user, S_TABU_NAM / S_TABU_DIS), not by CDS access control (decision XGEN-D01).

## Example use case

Extract all rows and load them as the first measurement document of each counter on S/4HANA.

## Open verification items

none
