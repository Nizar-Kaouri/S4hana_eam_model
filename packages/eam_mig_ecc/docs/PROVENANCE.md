# Source evidence and uncertainty

Official SAP documentation supports the business structures, not every field used by these provisional ECC wrappers.

- Task-list structures and PRTs: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/018d0b79415c448a9f3bc3282f0a0d7c.html
- Maintenance orders and settlement structures: https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/846562085c054f16ae13d851557cc086.html
- Work-center capacity source tables: https://help.sap.com/docs/SAP_HANA_LIVE/e31f67ce301b459b81a0c92d3b51d65b/69509ac8975e47f18182768a657fae74.html
- Capacity formula FORK2 and capacity NAME references: https://help.sap.com/doc/3db47a9323134b6bbe97e4eb5aadab40/2026/de-DE/LRP_DE_Conf_1.pdf
- IHSG permit segment context: https://help.sap.com/docs/SUPPORT_CONTENT/abap/3353523711.html?locale=en-US
- EQBS context: https://help.sap.com/docs/SAP_ERP/83ae2fb47d3f45099dc6d121b0a7706c/1bc1cc5340487214e10000000a174cb4.html

The XADD source markers explicitly require real-release DDIC confirmation of all new keys and fields. These references are not evidence of successful activation or target API compatibility. Target table references in mapping.json are conceptual lineage, not instructions to update SAP tables directly.
