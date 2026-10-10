# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

Load order derived from `sequence_after` in the mapping files. Objects on the same level can be loaded in parallel; every level needs the key maps of the levels before it.

| Level | Modules | Migration objects |
|---|---|---|
| 1 | [`work_center`](mapping/work_center.md) | Work center |
| 2 | [`functional_location`](mapping/functional_location.md) | Functional location |
| 3 | [`equipment`](mapping/equipment.md) | Equipment |
| 4 | [`classification`](mapping/classification.md), [`maintenance_notification`](mapping/maintenance_notification.md), [`measuring_point`](mapping/measuring_point.md), [`task_list`](mapping/task_list.md) | Classification (part of the equipment / functional location objects); Maintenance notification; Measuring point; Maintenance task list |
| 5 | [`measurement_document`](mapping/measurement_document.md) | Measurement document |
| 6 | [`maintenance_plan`](mapping/maintenance_plan.md) | Maintenance plan |
| 7 | [`maintenance_order`](mapping/maintenance_order.md) | Maintenance order |
| 8 | [`long_text`](mapping/long_text.md), [`object_partner`](mapping/object_partner.md), [`object_status`](mapping/object_status.md) | Long text (part of each object migration); Partner (part of the object migration); User status (part of the object migration) |

## Maps to prepare before the load

| Map | Kind | Used by |
|---|---|---|
| `equipment` | key map | classification, equipment, maintenance_notification, maintenance_order, maintenance_plan, measuring_point, task_list |
| `fixed_asset` | key map | equipment, functional_location |
| `functional_location` | key map | classification, equipment, functional_location, maintenance_notification, maintenance_order, maintenance_plan, measuring_point, task_list |
| `maintenance_item` | key map | maintenance_order, maintenance_plan |
| `maintenance_notification` | key map | maintenance_notification, maintenance_order |
| `maintenance_order` | key map | maintenance_order |
| `maintenance_plan` | key map | maintenance_order, maintenance_plan |
| `measuring_point` | key map | maintenance_plan, measurement_document, measuring_point |
| `task_list_group` | key map | maintenance_order, maintenance_plan, task_list |
| `work_center` | key map | equipment, maintenance_notification, maintenance_order, maintenance_plan, task_list, work_center |
| `activity_type` | value map | maintenance_order, task_list |
| `activity_type_pm` | value map | maintenance_order, maintenance_plan |
| `authorization_group` | value map | equipment, functional_location, maintenance_plan, measuring_point |
| `business_area` | value map | equipment, functional_location, maintenance_order, maintenance_plan |
| `code` | value map | maintenance_notification, measurement_document |
| `code_group` | value map | maintenance_notification, measuring_point |
| `company_code` | value map | equipment, functional_location, maintenance_order |
| `control_key` | value map | maintenance_order, task_list |
| `controlling_area` | value map | equipment, functional_location, maintenance_order, work_center |
| `cost_center` | value map | equipment, functional_location, maintenance_order, work_center |
| `equipment_category` | value map | equipment |
| `factory_calendar` | value map | maintenance_plan |
| `functional_location_category` | value map | functional_location |
| `item_category` | value map | maintenance_order |
| `location` | value map | equipment, functional_location |
| `maintenance_plan_category` | value map | maintenance_plan |
| `maintenance_strategy` | value map | maintenance_plan, task_list |
| `measuring_point_category` | value map | measuring_point |
| `notification_type` | value map | maintenance_notification, maintenance_plan |
| `order_type` | value map | maintenance_order, maintenance_plan |
| `partner_function` | value map | object_partner |
| `planner_group` | value map | equipment, functional_location, maintenance_notification, maintenance_order, maintenance_plan, task_list |
| `plant` | value map | equipment, functional_location, maintenance_notification, maintenance_order, maintenance_plan, task_list, work_center |
| `plant_section` | value map | equipment, functional_location, maintenance_notification |
| `priority` | value map | maintenance_notification, maintenance_order, maintenance_plan |
| `priority_type` | value map | maintenance_notification |
| `status_profile` | value map | object_status |
| `storage_location` | value map | maintenance_order |
| `structure_indicator` | value map | functional_location |
| `task_list_usage` | value map | task_list |
| `technical_object_type` | value map | equipment, functional_location |
| `unit_of_measure` | value map | equipment, maintenance_order, maintenance_plan, measurement_document, measuring_point, task_list |
| `user_status` | value map | object_status |
| `work_center_category` | value map | work_center |
| `work_center_responsible` | value map | work_center |
