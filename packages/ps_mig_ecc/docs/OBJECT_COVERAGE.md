# Business object coverage

This pack contains 30 native source extraction structures across 7 modules. All normal structures use B -> I -> C. The field catalog and mappings define the delivered scope; this is not a claim to reproduce every SAP transaction or industry extension.

Masters retain their business grain. Repeating languages, partners, statuses, addresses/communications, organizational records, validity/ECM records and document items are kept separately where applicable. Financial balances, postings and historical references retain their explicit cutover boundaries. No JEST status, postal address or equipment partner is invented for an object that has no such native relationship.

## Delivered structures

| Module | Native tables | Consumption structures |
|---|---|---|
| budget | BPGE, BPJA | `ZPSX_C_OverallBudgetMig`, `ZPSX_C_AnnualBudgetMig` |
| commitment | COOI | `ZPSX_C_CommitmentMig` |
| investment_measure | IMPR, IMTP, IMZO | `ZPSX_C_InvestProgramMig`, `ZPSX_C_InvestPositionMig`, `ZPSX_C_InvestAssignMig` |
| network | AFKO, AFVC, AFVV, AUFK, COBRB, JEST, JSTO, RESB, STXH | `ZPSX_C_NetworkHeaderMig`, `ZPSX_C_NetworkPlanMig`, `ZPSX_C_NetworkActivitMig`, `ZPSX_C_NetworkQuantitMig`, `ZPSX_C_NetworkStatusMig`, `ZPSX_C_NetworkPartnerMig`, `ZPSX_C_NetworkUserStatusMig`, `ZPSX_C_NetworkComponentMig`, `ZPSX_C_NetworkSettleMig`, `ZPSX_C_NetworkLongTextMig` |
| project | COBRB, IHPA, JEST, JSTO, PROJ, STXH | `ZPSX_C_ProjectMig`, `ZPSX_C_ProjectStatusMig`, `ZPSX_C_ProjectPartnerMig`, `ZPSX_C_ProjectUserStatusMig`, `ZPSX_C_ProjectSettleMig`, `ZPSX_C_ProjectLongTextMig` |
| project_cost | COEP | `ZPSX_C_ProjectCostMig` |
| wbs_element | COBRB, JEST, PRHI, PRPS, STXH | `ZPSX_C_WBSMig`, `ZPSX_C_WBSHierarchyMig`, `ZPSX_C_WBSStatusMig`, `ZPSX_C_WBSPartnerMig`, `ZPSX_C_WBSUserStatusMig`, `ZPSX_C_WBSSettleMig`, `ZPSX_C_WBSLongTextMig` |

## Preparation and target delivery

`customer/parent-relationships.json` records ordinary keyed parent links. `customer/text-relationships.json` records SAPscript ownership links. The supplied preparation project applies these to the same prepared business population. A text index contains identities; the shipped READ_TEXT report supplies the formatted content. Follow LONG_TEXT_WORKFLOW.md for organizational/item text ownership and target text identity mapping.

Classification and BOM/routing ECM counters are preserved. Evaluate the approved key date and change-number effectivity before posting; do not treat the greatest counter as universally valid. Generic classification exports and dedicated equipment/functional-location exports are alternative paths for the same population, not additive loads.

User-status exports carry profiles and E* codes for a separately mapped supported post-load operation. Active system-status exports remain references. Settlement rules retain receiver categories and identities, percentage/amount, currency and fiscal-period validity. Target technical object, address, person, class and BOM identities are mapped or generated through supported business interfaces.

The read-only full-row helper exports allowed native tables with their actual source DDIC schema for additional scalar fields. It does not change the named CDS projection or imply that every source field is accepted by a target migration template. Customer text-name rules, organizational values, numbering, approved populations and target interfaces are configuration inputs.

## SAP sources

- [Customer native tables and partner keys](https://help.sap.com/docs/SUPPORT_CONTENT/sd/3362915401.html).
- [Customer migration scope](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/a6b244390f3b4b7293c3a243561ccecd.html).
- [Purchasing partner native field mapping](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/af9ef57f504840d2b81be8667206d485/1d6f6bea1c3b4f049742e15a81ff86a0.html).
- [BAS communication identity/date/counter](https://help.sap.com/docs/SAP_S4HANA_CLOUD/f86dc2eb1f8b48c880a7607213104b27/6c5d521c11b94f3fa1abb05310a45ccb.html).
- [Native material tables](https://help.sap.com/docs/SUPPORT_CONTENT/spmm/3362168098.html).
- [Routing operation text LTXA1](https://help.sap.com/docs/r/9c73d7ba21854ef6be678402913647c3/7.57.12/en-US/fb8f36c26e5f456b95f7aea840e62df3.html).
- [Functional-location BOM ownership](https://help.sap.com/docs/SAP_CUSTOMER_RELATIONSHIP_MANAGEMENT/b90203d3616f482ebd9776775ac722d8/d0251ac1150f49198dc63a7b1f19d35e.html).
- [SAPscript long-text identities](https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_FOR_SOH_740/f6a2c35cb0dd4900ad16d735f1415331/4dafaf283c31288de10000000a42189e.html).

The native relationships and application behavior are documented by SAP; the packaged B/I/C exports and audited preparation workflow are ModuPorter engineering choices. Installed release definitions and chosen target interface signatures remain authoritative.
