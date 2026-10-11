# Business object coverage

This pack contains 73 native source extraction structures across 15 modules. All normal structures use B -> I -> C. The field catalog and mappings define the delivered scope; this is not a claim to reproduce every SAP transaction or industry extension.

Masters retain their business grain. Repeating languages, partners, statuses, addresses/communications, organizational records, validity/ECM records and document items are kept separately where applicable. Financial balances, postings and historical references retain their explicit cutover boundaries. No JEST status, postal address or equipment partner is invented for an object that has no such native relationship.

## Delivered structures

| Module | Native tables | Consumption structures |
|---|---|---|
| classification | KSSK, KLAH, AUSP | `ZEMX_C_ClassAssignmentMig`, `ZEMX_C_CharcValueMig` |
| core | ILOA, JEST, CABN, ADRC |  |
| equipment | ADRC, EQBS, EQKT, EQUI, EQUZ, ILOA, ADR6, ADR2, ADR3 | `ZEMX_C_EquipmentMig`, `ZEMX_C_EquipmentTextMig`, `ZEMX_C_EquipSerialStockMig`, `ZEMX_C_EquipPartnerMig`, `ZEMX_C_EquipStatusMig`, `ZEMX_C_EquipUserStatusMig`, `ZEMX_C_EquipLongTextMig`, `ZEMX_C_EquipAddressMig`, `ZEMX_C_EquipClassMig`, `ZEMX_C_EquipCharcMig`, `ZEMX_C_EquipEmailMig`, `ZEMX_C_EquipPhoneMig`, `ZEMX_C_EquipFaxMig` |
| equipment_bom | EQST, STAS, STKO, STPO | `ZEMX_C_EquipBOMAssignMig`, `ZEMX_C_BOMHeaderMig`, `ZEMX_C_BOMSelectionMig`, `ZEMX_C_BOMItemMig` |
| functional_location | ADR2, ADR3, ADR6, IFLOS, IFLOT, IFLOTX, STXH, TPST | `ZEMX_C_FuncLocMig`, `ZEMX_C_FuncLocTextMig`, `ZEMX_C_FuncLocLabelMig`, `ZEMX_C_FuncLocAddressMig`, `ZEMX_C_FuncLocPartnerMig`, `ZEMX_C_FuncLocStatusMig`, `ZEMX_C_FuncLocUserStatusMig`, `ZEMX_C_FuncLocClassMig`, `ZEMX_C_FuncLocCharcMig`, `ZEMX_C_FuncLocEmailMig`, `ZEMX_C_FuncLocPhoneMig`, `ZEMX_C_FuncLocFaxMig`, `ZEMX_C_FuncLocLongTextMig`, `ZEMX_C_FuncLocBOMMig` |
| long_text | STXH | `ZEMX_C_LongTextIndexMig` |
| maintenance_notification | QMEL, QMFE, QMIH, QMMA, QMSM, QMUR, STXH | `ZEMX_C_MaintNotificationMig`, `ZEMX_C_MaintNotifItemMig`, `ZEMX_C_NotifCauseMig`, `ZEMX_C_NotifTaskMig`, `ZEMX_C_NotifActivityMig`, `ZEMX_C_MaintNotifPartnerMig`, `ZEMX_C_MaintNotifStatusMig`, `ZEMX_C_NotifUserStatusMig`, `ZEMX_C_NotifLongTextMig` |
| maintenance_order | AFIH, AFKO, AFVC, AFVV, AUFK, COBRB, IHSG, RESB, STXH | `ZEMX_C_MaintOrderMig`, `ZEMX_C_MaintOrderOperationMig`, `ZEMX_C_MaintOrderComponentMig`, `ZEMX_C_OrderSettlementMig`, `ZEMX_C_OrderPermitMig`, `ZEMX_C_MaintOrderPartnerMig`, `ZEMX_C_MaintOrderStatusMig`, `ZEMX_C_OrderUserStatusMig`, `ZEMX_C_OrderLongTextMig` |
| maintenance_plan | MHIS, MMPT, MPLA, MPOS, STXH | `ZEMX_C_MaintenancePlanMig`, `ZEMX_C_MaintenanceItemMig`, `ZEMX_C_MaintPlanCycleMig`, `ZEMX_C_PlanLongTextMig` |
| measurement_document | IMRG | `ZEMX_C_MeasReadingMig` |
| measuring_point | IMPTT, STXH | `ZEMX_C_MeasuringPointMig`, `ZEMX_C_MeasPointLongTextMig` |
| object_partner | IHPA | `ZEMX_C_ObjectPartnerMig` |
| object_status | JEST, JSTO, TJ30T | `ZEMX_C_UserStatusMig` |
| task_list | EAPL, PLAS, PLFH, PLKO, PLMZ, PLPO, PLWP, STXH, TAPL | `ZEMX_C_TaskListMig`, `ZEMX_C_TaskListOperationMig`, `ZEMX_C_TaskListAllocationMig`, `ZEMX_C_TaskListCompMig`, `ZEMX_C_TaskListPRTMig`, `ZEMX_C_TaskListPackageMig`, `ZEMX_C_TaskListLongTextMig` |
| work_center | CRCA, CRCO, CRHD, CRTX, KAKO | `ZEMX_C_WorkCenterMig`, `ZEMX_C_WorkCenterTextMig`, `ZEMX_C_WorkCenterCostCtrMig`, `ZEMX_C_WorkCenterCapacityMig`, `ZEMX_C_CapacityHeaderMig` |

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
