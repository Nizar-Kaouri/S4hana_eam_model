# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`work_center`](mapping/work_center.md) | `ZEMX_C_WorkCenterMig`, `ZEMX_C_WorkCenterTextMig`, `ZEMX_C_WorkCenterCostCtrMig`, `ZEMX_C_WorkCenterCapacityMig`, `ZEMX_C_CapacityHeaderMig` |
| 2 | [`functional_location`](mapping/functional_location.md) | `ZEMX_C_FuncLocMig`, `ZEMX_C_FuncLocTextMig`, `ZEMX_C_FuncLocLabelMig` |
| 3 | [`equipment`](mapping/equipment.md) | `ZEMX_C_EquipmentMig`, `ZEMX_C_EquipmentTextMig`, `ZEMX_C_EquipSerialStockMig` |
| 4 | [`classification`](mapping/classification.md), [`equipment_bom`](mapping/equipment_bom.md), [`maintenance_notification`](mapping/maintenance_notification.md), [`measuring_point`](mapping/measuring_point.md), [`task_list`](mapping/task_list.md) | `ZEMX_C_ClassAssignmentMig`, `ZEMX_C_CharcValueMig`, `ZEMX_C_EquipBOMAssignMig`, `ZEMX_C_BOMHeaderMig`, `ZEMX_C_BOMSelectionMig`, `ZEMX_C_BOMItemMig`, `ZEMX_C_MaintNotificationMig`, `ZEMX_C_MaintNotifItemMig`, `ZEMX_C_NotifCauseMig`, `ZEMX_C_NotifTaskMig`, `ZEMX_C_NotifActivityMig`, `ZEMX_C_MeasuringPointMig`, `ZEMX_C_TaskListMig`, `ZEMX_C_TaskListOperationMig`, `ZEMX_C_TaskListAllocationMig`, `ZEMX_C_TaskListCompMig`, `ZEMX_C_TaskListPRTMig`, `ZEMX_C_TaskListPackageMig` |
| 5 | [`measurement_document`](mapping/measurement_document.md) | `ZEMX_C_MeasReadingMig` |
| 6 | [`maintenance_plan`](mapping/maintenance_plan.md) | `ZEMX_C_MaintenancePlanMig`, `ZEMX_C_MaintenanceItemMig`, `ZEMX_C_MaintPlanCycleMig` |
| 7 | [`maintenance_order`](mapping/maintenance_order.md) | `ZEMX_C_MaintOrderMig`, `ZEMX_C_MaintOrderOperationMig`, `ZEMX_C_MaintOrderComponentMig`, `ZEMX_C_OrderSettlementMig`, `ZEMX_C_OrderPermitMig` |
| 8 | [`long_text`](mapping/long_text.md), [`object_partner`](mapping/object_partner.md), [`object_status`](mapping/object_status.md) | `ZEMX_C_LongTextIndexMig`, `ZEMX_C_ObjectPartnerMig`, `ZEMX_C_UserStatusMig` |
