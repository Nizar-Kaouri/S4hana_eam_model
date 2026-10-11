# Project guidance

The owner requires all work to follow SAP documented best practices. Read
`docs/SAP_DESIGN_PRINCIPLES.md` before changing migration architecture or views.
Use primary SAP documentation for release-dependent behavior and record the
supporting sources. Distinguish documented SAP behavior from engineering choices.

Preserve native tables -> B (Basic) -> I (Interface/Composite) -> C (Consumption).
Keep master rows unique and repeating children separately keyed and scoped to the
same selected business population. Never write directly to SAP application tables
or treat source system statuses and technical address numbers as target identities.
Do not claim SAP activation, target API compatibility or certification from offline checks.

EAM equipment address and child-export rules are documented in
`packages/eam_mig_ecc/docs/EQUIPMENT_ARCHITECTURE.md`.
