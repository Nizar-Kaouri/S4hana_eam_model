# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel. The consumption views translate values with the mapping table `ZEMX_MAP` on the ECC system: value maps are filled before the load; key maps of objects that get new numbers are written back after each level (load program via RFC or upload of the load log), before the next level is extracted.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`work_center`](mapping/work_center.md) | `ZEMX_C_WorkCenterMig`, `ZEMX_C_WorkCenterTextMig`, `ZEMX_C_WorkCenterCostCtrMig` |
| 2 | [`functional_location`](mapping/functional_location.md) | `ZEMX_C_FuncLocMig`, `ZEMX_C_FuncLocTextMig` |
| 3 | [`equipment`](mapping/equipment.md) | `ZEMX_C_EquipmentMig`, `ZEMX_C_EquipmentTextMig` |
| 4 | [`classification`](mapping/classification.md), [`maintenance_notification`](mapping/maintenance_notification.md), [`measuring_point`](mapping/measuring_point.md), [`task_list`](mapping/task_list.md) | `ZEMX_C_ClassAssignmentMig`, `ZEMX_C_CharcValueMig`, `ZEMX_C_MaintNotificationMig`, `ZEMX_C_MaintNotifItemMig`, `ZEMX_C_MeasuringPointMig`, `ZEMX_C_TaskListMig`, `ZEMX_C_TaskListOperationMig`, `ZEMX_C_TaskListAllocationMig` |
| 5 | [`measurement_document`](mapping/measurement_document.md) | `ZEMX_C_MeasReadingMig` |
| 6 | [`maintenance_plan`](mapping/maintenance_plan.md) | `ZEMX_C_MaintenancePlanMig`, `ZEMX_C_MaintenanceItemMig`, `ZEMX_C_MaintPlanCycleMig` |
| 7 | [`maintenance_order`](mapping/maintenance_order.md) | `ZEMX_C_MaintOrderMig`, `ZEMX_C_MaintOrderOperationMig`, `ZEMX_C_MaintOrderComponentMig` |
| 8 | [`long_text`](mapping/long_text.md), [`object_partner`](mapping/object_partner.md), [`object_status`](mapping/object_status.md) | `ZEMX_C_LongTextIndexMig`, `ZEMX_C_ObjectPartnerMig`, `ZEMX_C_UserStatusMig` |

## Maps in `ZEMX_MAP`

| MAP_NAME | Kind | Filled by | Used by |
|---|---|---|---|
| `BUSINESS_PARTNER` | key map | other migration | object_partner |
| `EQUIPMENT` | key map | load program of `equipment` | classification, equipment, maintenance_notification, maintenance_order, maintenance_plan, measuring_point, object_partner, object_status, task_list |
| `FIXED_ASSET` | key map | other migration | equipment, functional_location |
| `FUNCTIONAL_LOCATION` | key map | load program of `functional_location` | classification, equipment, functional_location, maintenance_notification, maintenance_order, maintenance_plan, measuring_point, object_partner, object_status, task_list |
| `MAINTENANCE_ITEM` | key map | load program of `maintenance_plan` | maintenance_order, maintenance_plan |
| `MAINTENANCE_NOTIFICATION` | key map | load program of `maintenance_notification` | maintenance_notification, maintenance_order, object_partner, object_status |
| `MAINTENANCE_ORDER` | key map | load program of `maintenance_order` | maintenance_order, object_partner, object_status |
| `MAINTENANCE_PLAN` | key map | load program of `maintenance_plan` | maintenance_order, maintenance_plan |
| `MATERIAL` | key map | other migration | equipment, functional_location, maintenance_order |
| `MEASURING_POINT` | key map | load program of `measuring_point` | maintenance_plan, measurement_document, measuring_point |
| `TASK_LIST_GROUP` | key map | load program of `task_list` | maintenance_order, maintenance_plan, task_list |
| `WORK_CENTER` | key map | load program of `work_center` | equipment, maintenance_notification, maintenance_order, maintenance_plan, task_list, work_center |
| `ACTIVITY_TYPE` | value map | customer (before the load) | maintenance_order, task_list |
| `ACTIVITY_TYPE_PM` | value map | customer (before the load) | maintenance_order, maintenance_plan |
| `AUTHORIZATION_GROUP` | value map | customer (before the load) | equipment, functional_location, maintenance_plan, measuring_point |
| `BUSINESS_AREA` | value map | customer (before the load) | equipment, functional_location, maintenance_order, maintenance_plan |
| `CODE` | value map | customer (before the load) | maintenance_notification, measurement_document |
| `CODE_GROUP` | value map | customer (before the load) | maintenance_notification, measuring_point |
| `COMPANY_CODE` | value map | customer (before the load) | equipment, functional_location, maintenance_order |
| `CONTROL_KEY` | value map | customer (before the load) | maintenance_order, task_list |
| `CONTROLLING_AREA` | value map | customer (before the load) | equipment, functional_location, maintenance_order, work_center |
| `COST_CENTER` | value map | customer (before the load) | equipment, functional_location, maintenance_order, work_center |
| `EQUIPMENT_CATEGORY` | value map | customer (before the load) | equipment |
| `FACTORY_CALENDAR` | value map | customer (before the load) | maintenance_plan |
| `FUNCTIONAL_LOCATION_CATEGORY` | value map | customer (before the load) | functional_location |
| `ITEM_CATEGORY` | value map | customer (before the load) | maintenance_order |
| `LOCATION` | value map | customer (before the load) | equipment, functional_location |
| `MAINTENANCE_PLAN_CATEGORY` | value map | customer (before the load) | maintenance_plan |
| `MAINTENANCE_STRATEGY` | value map | customer (before the load) | maintenance_plan, task_list |
| `MEASURING_POINT_CATEGORY` | value map | customer (before the load) | measuring_point |
| `NOTIFICATION_TYPE` | value map | customer (before the load) | maintenance_notification, maintenance_plan |
| `ORDER_TYPE` | value map | customer (before the load) | maintenance_order, maintenance_plan |
| `PARTNER_FUNCTION` | value map | customer (before the load) | object_partner |
| `PLANNER_GROUP` | value map | customer (before the load) | equipment, functional_location, maintenance_notification, maintenance_order, maintenance_plan, task_list |
| `PLANT` | value map | customer (before the load) | equipment, functional_location, maintenance_notification, maintenance_order, maintenance_plan, task_list, work_center |
| `PLANT_SECTION` | value map | customer (before the load) | equipment, functional_location, maintenance_notification |
| `PRIORITY` | value map | customer (before the load) | maintenance_notification, maintenance_order, maintenance_plan |
| `PRIORITY_TYPE` | value map | customer (before the load) | maintenance_notification |
| `STATUS_PROFILE` | value map | customer (before the load) | object_status |
| `STORAGE_LOCATION` | value map | customer (before the load) | maintenance_order |
| `STRUCTURE_INDICATOR` | value map | customer (before the load) | functional_location |
| `TASK_LIST_STATUS` | value map | customer (before the load) | task_list |
| `TASK_LIST_USAGE` | value map | customer (before the load) | task_list, work_center |
| `TECHNICAL_OBJECT_TYPE` | value map | customer (before the load) | equipment, functional_location |
| `UNIT_OF_MEASURE` | value map | customer (before the load) | maintenance_plan, measurement_document, measuring_point |
| `USER_STATUS` | value map | customer (before the load) | object_status |
| `WORK_CENTER_CATEGORY` | value map | customer (before the load) | work_center |
| `WORK_CENTER_RESPONSIBLE` | value map | customer (before the load) | work_center |
