# Compatibility and delivery boundary

- Source assumption: ECC 6.0, NetWeaver 7.40 SP08+, classic CDS.
- Target assumption: S/4HANA 2025 on-premise or Private Cloud. No target API compatibility has been established.
- Actual tested releases, databases and SAP activation: none.
- Offline linting parses syntax; it does not validate DDIC field availability, associations, business semantics or authorizations.
- No system conversion, target loading program, transport export, support service or release certification is included in this draft.
- Long-text content, serial stock posting, material serial profiles, shift calendars and full available-capacity intervals remain customer/integration extensions.
- CapacityHeader is a reference ledger. Filter it by CapacityInternalID values in the selected WorkCenterCapacity extract.
- BOMHeader/BOMSelection/BOMItem are equipment-category version ledgers, not flattened current BOMs. Restrict them to BillOfMaterial values in EquipBOMAssign. Resolve alternative selection, change numbers, valid-from dates and deletion states at cutover.
- Task-list child views provisionally select the highest recorded counter for each table identity. They are not an engineering-change effectivity engine; future states require an explicit customer cutover rule.
- Task-list component and PRT outputs retain technical allocation references. Resolve operation nodes to exported operation numbers, and PRT IDs to the appropriate business object before target posting.
- Settlement receiver WBS IDs, permit assignments and alternative label identities require real-system verification.
- S/4HANA companion counts/compare views cover existing main objects only. New child structures and BOMs require customer reconciliation; no automatic comparison is claimed.
