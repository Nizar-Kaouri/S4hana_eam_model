# SAP design principles

Standing project requirement: follow SAP documented best practices for every change. Verify release-specific behavior against primary SAP documentation; distinguish documented facts from engineering design choices.

- Keep native tables -> B (Basic) -> I (Interface/Composite) -> C (Consumption).
- Preserve business grain and complete keys. A declared to-one cardinality must be supported by the join predicates and actual source uniqueness.
- Keep repeating texts, partners and statuses as child structures; align their selected business-object scope with the master extract.
- Use supported SAP business interfaces for posting; never write application tables directly or replay system statuses.
- Retain source/target key mapping and SAP-generated address/object identities.
- Do not label arbitrary custom architecture as SAP certified or claim unconfirmed target template fields.
- Before publication, verify dependent-table changes are covered by extraction semantics and cutover snapshots.

Equipment implementation and SAP sources: packages/eam_mig_ecc/docs/EQUIPMENT_ARCHITECTURE.md.
