# ZEMX_I_MeasPointLastReading

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been activated on a system.

| | |
|---|---|
| Description | Last reading per measuring point |
| Module | `measurement_document` |
| Batch | 2 |
| Layer | composite (`@VDM.viewType: #COMPOSITE`) |
| Kind | view |
| Data category | #FACT |
| Data source | `ZEMX_I_MeasPointLastDoc`, join `ZEMX_I_MeasurementDocument` |
| Source file | `src/zemx_i_measpointlastreading.ddls.asddls` |

## Purpose

Latest valid reading per measuring point: migrated as the initial reading so that counters and performance-based plans continue.

## Keys

- `MeasuringPoint`

## Associations defined here

- none

## Access control

No DCL by design: Migration view on ECC: it must return every record of the object. Access is controlled by the user / RFC user of the load program and the extraction channel (S_TABU_NAM), not by CDS access control (decision XGEN-D01; CDS access control also needs a newer release than the 7.40 SP08 baseline).

## Example use case

Read the last reading of every counter.

## Open verification items

none
