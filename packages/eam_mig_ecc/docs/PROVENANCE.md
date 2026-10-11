# Source evidence and uncertainty

Official SAP documentation supports the business structures, not every field used by these provisional ECC wrappers.

- Task-list structures and PRTs: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/018d0b79415c448a9f3bc3282f0a0d7c.html
- Maintenance orders and settlement structures: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/846562085c054f16ae13d851557cc086.html
- Work-center capacity source tables: https://help.sap.com/docs/SAP_HANA_LIVE/e31f67ce301b459b81a0c92d3b51d65b/69509ac8975e47f18182768a657fae74.html
- Capacity formula FORK2 and capacity NAME references: https://help.sap.com/doc/3db47a9323134b6bbe97e4eb5aadab40/2026/de-DE/LRP_DE_Conf_1.pdf
- IHSG permit segment context: https://help.sap.com/docs/SUPPORT_CONTENT/abap/3353523711.html?locale=en-US
- EQBS context: https://help.sap.com/docs/SAP_ERP/83ae2fb47d3f45099dc6d121b0a7706c/1bc1cc5340487214e10000000a174cb4.html


Additional helper inventory evidence:

- Capacity/shift/formula tables: https://help.sap.com/docs/SAP_ERP/1b3849a12adb4f1e9f2f409dbe175c8e/1770bd534f22b44ce10000000a174cb4.html?version=6.18.latest
- Routing/task-list relationship table inventory: https://help.sap.com/docs/PRODUCT_ID/c8f0820b35bf40b8b80cbb400fe1a8c0/617cbe532789b44ce10000000a174cb4.html?locale=de-DE
- Service limit tables: https://help.sap.com/saphelp_snc70/helpdata/EN/6a/c68d5377a0ec23e10000000a174cb4/content.htm?no_cache=true
- Task-list dependency/service business structures: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/6a850a18d1834d24b2af1e45b4eb457a.html

These references support inventory choices, not exact release-specific field/type or runtime compatibility. The full-row helper emits the actual DDIC schema; verify every temporal/cohort contract against it.
