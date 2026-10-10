# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`freight_agreement`](mapping/freight_agreement.md), [`transport_location`](mapping/transport_location.md), [`transport_resource`](mapping/transport_resource.md) | `ZTMX_C_FreightAgreeMig`, `ZTMX_C_FreightRateMig`, `ZTMX_C_FreightScaleMig`, `ZTMX_C_TransportLocMig`, `ZTMX_C_TransportResMig`, `ZTMX_C_ResCapacityMig` |
| 2 | [`freight_unit`](mapping/freight_unit.md), [`transport_lane`](mapping/transport_lane.md), [`transport_schedule`](mapping/transport_schedule.md) | `ZTMX_C_FreightUnitMig`, `ZTMX_C_FreightUnitIteMig`, `ZTMX_C_FreightUnitStoMig`, `ZTMX_C_TransportLaneMig`, `ZTMX_C_LaneCarrierMig`, `ZTMX_C_ScheduleMig`, `ZTMX_C_ScheduleStopMig` |
| 3 | [`freight_order`](mapping/freight_order.md) | `ZTMX_C_FreightOrderMig`, `ZTMX_C_FreightOrdItemMig`, `ZTMX_C_FreightOrdStopMig`, `ZTMX_C_FreightStageMig` |
| 4 | [`freight_settlement`](mapping/freight_settlement.md) | `ZTMX_C_FreightSettleMig`, `ZTMX_C_SettleItemMig` |
